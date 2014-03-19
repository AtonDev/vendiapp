class Sellers::RegistrationsController < Devise::RegistrationsController


def new_phone_verification
  build_resource sign_up_params

  if true #resource.valid?(:create)
    @phone_verification_code = "%04d" % rand(9999)

    ## send text message


    ## render form to enter verification code
    render template: "phone/verification"
  else
      clean_up_passwords resource
      render 'new'
  end
end

#def create
#  new_phone_verification
#end

# send create form to this method 
def verify_phone
  @sign_up_params = sign_up_params


  if phone_code_params == @phone_code_params
    ## update phone verified?
    render 'create'
  else
    render 'new'
    @sign_up_params = nil
  end
end




protected
  def sign_up_params
    result = @sign_up_parameters || devise_parameter_sanitizer.sanitize(:sign_up)
    @sign_up_params = nil
    result
  end

  def phone_code_param
    params.require(:code)
  end
end
