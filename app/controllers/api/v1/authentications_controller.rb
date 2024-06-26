module Api
  module V1
    class AuthenticationsController < BaseController
      def create
        user = login(params[:email], params[:password])
        raise ActiveRecord::RecordNotFound unless user

        set_token(user)
        json_string = UserSerializer.new(user).serialized_json
        render json: json_string
      end

      private

      def form_authenticity_token; end
    end
  end
end
