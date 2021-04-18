class CategoriesController < ApplicationController

  before_action :search_category, only: [:index, :search]

  def index
    set_category_column
  end

  def new
    @category_idea = CategoriesIdea.new
  end

  def create
    @category_idea = CategoriesIdea.new(idea_params)
    if @category_idea.valid?
      @category_idea.save
      return redirect_to action: :index
    else
      render action: :new
    end
  end

  def search
    @results = @p.result.includes(:ideas)
  end
  
  private

  def idea_params
    params.require(:categories_idea).permit(:body, :name)
  end

  def search_category
    @p = Category.ransack(params[:q])
  end

  def set_category_column
    @category_name = Category.select("name").distinct
  end

end