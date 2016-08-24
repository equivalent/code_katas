class ArticlesController < ApplicationController
  before_action :find_article

  def show
    render json: @article.as_json
  end

  private
    def find_article
      @article = Article.find(params[:id])
    end
end
