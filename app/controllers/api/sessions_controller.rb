module Api
  class SessionsController < Api::OpenBaseController
    def create
      user = User.find_by_email(params[:email])
      # If the user exists AND the password entered is correct.
      if user && user.authenticate(params[:password])
        render json: user.auth_token
      else
        render nothing: true, status: :bad_request
      end
    end
  end
end
