require 'rails_helper'
describe CategoriesController, type: :request do

  before do
    @category_idea = CategoriesIdea.new(name: "IT", body: "ふふふ")
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get root_path
      binding.pry
      expect(response.status).to eq 200
    end 
    it "indexアクションにリクエストするとレスポンスにカテゴリー検索フォームが存在する" do 
      get root_path
      expect(response.body).to include "検索"
    end
  end

  describe "GET #search" do
    it "searchアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get categories_search_path
      expect(response.status).to eq 200
    end
    it "searchアクションにリクエストするとレスポンスに投稿済みのカテゴリーが存在する" do 
      get categories_search_path
      expect(response.body).to include @category_idea.name
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのアイディアが存在する" do 
      get categories_search_path
      expect(response.body).to include @category_idea.body
    end
  end

end