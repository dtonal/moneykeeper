module Api
  class BaseController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :authenticate_base
    respond_to :json

    protected
      def authenticate
        authenticate_or_request_with_http_token do |token, options|
          @current_user = User.find_by(auth_token: token)
        end
      end

      def authenticate_base
        authenticate_or_request_with_http_basic do |username, password|
        puts "username #{username}"
        puts "password #{password}"
        @current_user = User.find_by_email(username)
        @current_user && @current_user.authenticate(password)
        end
     end

  end
end
