module Api
  class OpenBaseController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json
  end
end
