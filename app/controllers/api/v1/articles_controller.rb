# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < BaseController
      def index
        articles = Article.all
        json_string = ArticleSerializer.new(articles).serialized_json
        render json: json_string
      end

      def show
        article = Article.find(params[:id])
        json_string = ArticleSerializer.new(article).serialized_json
        render json: json_string
      end
    end
  end
end
