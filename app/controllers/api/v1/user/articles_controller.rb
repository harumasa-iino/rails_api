module Api
  module V1
    class User::ArticlesController < BaseController
      before_action :set_user_article, only: [:show, :update, :destroy]
      before_action :authenticate

      # GET /user/articles
      def index
        @user_articles = Article.where(user_id: current_user.id)
        render json: @user_articles
      end

      # GET /user/articles/1
      def show
        @user_article = @user_articles.where(id: params[:id])
       render json: @user_article
      end

      # POST /user/articles
      def create
        @user_article = current_user.articles.new(user_article_params)

        if @user_article.save
          render json: @user_article, status: :created
        else
          render json: @user_article.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /user/articles/1
      def update
        if @user_article.update(user_article_params)
          render json: @user_article
        else
          render json: @user_article.errors, status: :unprocessable_entity
        end
      end

      # DELETE /user/articles/1
      def destroy
        @user_article.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_user_article
        @user_articles = Article.where(user_id: current_user.id)
      end

      # Only allow a trusted parameter "white list" through.
      def user_article_params
        params.require(:article).permit(:title, :content, :status, :user_id)
      end
    end
  end
end
