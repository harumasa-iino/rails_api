# frozen_string_literal: true

module Api
  module V1
    class User::ArticlesController < BaseController
      before_action :set_articles, only: :index
      before_action :set_article, only: %i[show update destroy]

      def index
        json_string = ArticleSerializer.new(@articles).serialized_json

        render json: json_string
      end

      def create
        article = current_user.articles.new(article_params)

        if article.save
          json_string = ArticleSerializer.new(article).serialized_json
          render json: json_string
        else
          render_400(nil, article.errors.full_messages)
        end
      end

      def update
        if @article.update(article_params)
          json_string = ArticleSerializer.new(@article).serialized_json
          render json: json_string
        else
          render_400(nil, article.errors.full_messages)
        end
      end

      def destroy
        @article.destroy!
        set_articles
        json_string = ArticleSerializer.new(@articles).serialized_json

        render json: json_string
      end

      private

      def set_article
        @article = current_user.articles.find(params[:id])
      end

      def set_articles
        @articles = current_user.articles
      end

      def article_params
        params.require(:article).permit(:title, :contents, :status)
      end
    end
  end
end