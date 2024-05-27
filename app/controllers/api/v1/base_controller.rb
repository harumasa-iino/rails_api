# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      include ExceptionHandler
      def set_token(user)
        api_key = user.grant_api_key
        response.headers['AccessToken'] = api_key.access_token
      end
    end
  end
end
