# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < BaseController
      def index
        article = Article.all
        json_string = ArticleSerializer.new(article).serialized_json
        render json: json_string
      end
    end
  end
end
