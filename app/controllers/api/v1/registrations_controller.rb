module Api
  module V1
    class RegistrationsController < BaseController
      def create
        @user = User.new(user_params)
        if @user.save
          json_string = UserSerializer.new(@user).serialized_json
          set_token(@user)
          render json: json_string
        else
          render_request(nil, @user.errors.full_messages)
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password)
      end
    end
  end
end
