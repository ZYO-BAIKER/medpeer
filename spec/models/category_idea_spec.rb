require 'rails_helper'

RSpec.describe CategoriesIdea, type: :model do
  describe '#create' do
    before do
      @category_idea = CategoriesIdea.new(name: "IT", body: "ふふふ")
    end

    it '全てのカラムが存在すれば保存できること' do
      expect(@category_idea).to be_valid
    end

    it 'nameが空では保存できないこと' do
      @category_idea.name = nil
      @category_idea.valid?
      expect(@category_idea.errors.full_messages).to include("カテゴリーを入力してください")
    end

    it 'bodyが空では保存できないこと' do
      @category_idea.body = nil
      @category_idea.valid?
      expect(@category_idea.errors.full_messages).to include("アイディアを入力してください")
    end

  end
end

