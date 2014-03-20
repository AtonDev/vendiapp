class Sellers::RegistrationsController < Devise::RegistrationsController

def new_phone_verification
  build_resource sign_up_params

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
 

# send create form to this method 
def verify_phone
  debugger
  verification_code_obj = VerificationCode.find(phone_code_param[:code_id])
  if phone_code_param[:code] == verification_code_obj.code
    verification_code_obj.destroy
    render 'create'
  else
    flash[:danger] = "Your verification code did not match try again."
    redirect_to :back
  end
end




protected
  def sign_up_params
    result = @sign_up_parameters || devise_parameter_sanitizer.sanitize(:sign_up)
    @sign_up_params = nil
    result
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
      :body => "Hola Mercedes, #{verification_code}"
    )
  end

end
