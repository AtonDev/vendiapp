class Sellers::RegistrationsController < Devise::RegistrationsController

def new_phone_verification
  build_resource sign_up_params
  session[:sign_up] = sign_up_params
  if resource.valid?(:create)
    v_code = create_verification_code
    @code_id = v_code.id
    @phone_number = sign_up_params[:phone_number]
    ## send text message
    send_verification_sms(@phone_number, v_code.code)
    ## render form to enter verification code
    render template: "phone/verification"
  else
      clean_up_passwords resource
      render 'new'
  end
end




def create
  @code_id = phone_code_param[:code_id]
  verification_code_obj = VerificationCode.find(@code_id)
  if phone_code_param[:code] == verification_code_obj.code
    verification_code_obj.destroy
    debugger
    build_resource(sign_up_params)
    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        redirect_to dashboard_path
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        redirect_to dashboard_path
      end
    else
      clean_up_passwords resource
      render 'new'
    end
  else
    flash[:danger] = "Your verification code did not match the one we sent you, try again."
    render template: "phone/verification"
  end
end




protected


  def sign_up_params
    session[:sign_up] || devise_parameter_sanitizer.sanitize(:sign_up)
  end

  def phone_code_param
    params.permit(:code, :code_id)
  end

  def create_verification_code
    code_str = "%04d" % rand(9999)
    VerificationCode.create(:code => code_str)
  end

  def send_verification_sms(number_to_send_to, verification_code)
    number_to_send_to = sign_up_params[:phone_number]
    twilio_sid = "AC31969b5308cfc7d3532bafd6c5f770e9"
    twilio_token = "92e721db272c2f8e4070fd8ffc0ca536"
    twilio_phone_number = "5103808583"
 
    twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
 
    twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "Vendi verification code: #{verification_code}"
    )
  end

end
