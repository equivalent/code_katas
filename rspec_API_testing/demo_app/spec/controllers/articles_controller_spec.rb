require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "GET #show" do
    before do
      get :show, id: article.id
    end

    let(:article) { Article.create(title: 'Hello World') }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    context "raw RSpec version" do
      it "respond body JSON with attributes" do
        hash_body = nil
        expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
        expect(hash_body).to match({
          id: be_kind_of(Integer),
          title: 'Hello World'
        })
      end
    end

    context "using custom JSON helpers and matchers" do
      it "respond body JSON with attributes" do
        expect(response.body).to look_like_json
        expect(body_as_json).to match({
          id: be_kind_of(Integer),
          title: 'Hello World'
        })
      end
    end
  end
end
