module Api
  class SessionsController < Api::OpenBaseController
    def create
      @user = User.find_by_email(params[:email])
      # If the user exists AND the password entered is correct.
      if @user && @user.authenticate(params[:password])
        output = {'token' => @user.auth_token}.to_json
        render json: output
      else
        render nothing: true, status: :bad_request
      end
    end
  end
end
