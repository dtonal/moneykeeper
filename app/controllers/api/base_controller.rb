module Api
  class BaseController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :authenticate
    respond_to :json

    protected
      def authenticate
        authenticate_or_request_with_http_token do |token, options|
          @current_user = User.find_by(auth_token: token)
        end
      end
  end
end
