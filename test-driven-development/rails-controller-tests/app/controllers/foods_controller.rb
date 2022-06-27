class FoodsController < ApplicationController
  def index
    @foods = params[:letter].nil? ? Food.all : Food.by_letter(params[:letter])
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def edit
    @food = Food.find(params[:id])
  end

  def create
    food_params = params[:food]
    @food = Food.new(name: food_params[:name], description: food_params[:description], price: food_params[:price])

    if @food.valid?
      @food.save
      redirect_to action: :show, id: @food.id
    else
      render action: :new
    end
  end

  def update
    food_params = params[:food]
    @food = Food.find(params[:id])
    @food.name = food_params[:name]

    if @food.valid?
      @food.save
      redirect_to action: :show, id: @food.id
    else
      render action: :edit
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to action: :index
  end
end
