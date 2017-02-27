class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should also create an action method in this controller like this:
  # def twitter
  # end
  def github
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to new_user_registration_url
      set_flash_message(:alert, 'No se pudo iniciar sesión con GitHub.')
    end
  end

  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to new_user_registration_url
      set_flash_message(:alert, 'No se pudo iniciar sesión con Google.')
    end
  end
end
