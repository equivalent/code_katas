require 'rails_helper'

RSpec.describe V2::ArticlesController do
  describe "GET #show" do
    def trigger
      get :show, id: article.id
    end

    let(:article) { Article.create(title: 'Hello World') }

    it "returns http success" do
      trigger
      expect(response).to have_http_status(:success)
    end

    context "Option 1: Controller spec as an Integration test" do
      it "respond body JSON with attributes" do
        trigger
        expect(response.body).to look_like_json
        expect(body_as_json).to be_kind_of(Hash)
      end

      it "correct article attributes are rendered" do
        expect_any_instance_of(ArticleSerializer)
          .to receive(:as_json)
          .and_call_original   # this is not a stub

        trigger

        article_id = body_as_json
          .fetch(:article)
          .fetch(:id)
          .to_i

        expect(article_id).to eq article.id
      end
    end

    context "Option 2: Stubbed Controller internals" do
      before do
        serializer_double = instance_double(ArticleSerializer)

        expect(ArticleSerializer)
          .to receive(:new)
          .and_return(serializer_double)

        expect(serializer_double)
          .to receive(:as_json)
          .and_return(article: 'stubbed hash by ArticleSerializer')

        trigger
      end

      it "uses ArticleSerializer to render body JSON" do
        expect(body_as_json).to match(article: 'stubbed hash by ArticleSerializer')
      end
    end
  end
end
