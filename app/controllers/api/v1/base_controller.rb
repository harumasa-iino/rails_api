# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      include ExceptionHandler
      def set_token(user)
        api_key = user.grant_api_key
        response.headers['AccessToken'] = api_key.access_token
      end

      private

      def current_user
        @_current_user
      end

      def authenticate
        authenticate_or_request_with_http_token do |token, options|
          @_current_user ||= ApiKey.valid_expire.find_by(access_token: token)&.user
        end
      end
    end
  end
end
