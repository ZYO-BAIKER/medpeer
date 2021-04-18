class CategoriesIdea

  include ActiveModel::Model
  attr_accessor :body, :name

  with_options presence: true do
    validates :body, :name
  end

  def save
    category = Category.create(name: name)
    Idea.create(body: body, category_id: category.id)
  end

end