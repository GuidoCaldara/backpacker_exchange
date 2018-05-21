class ItemsController < ApplicationController

before_action :set_item, only: [:show, :update, :edit, :destroy]


  def index
    if params["city"]
      @current_city =  params["city"]
      @filtered_items = Item.city_query(params["city"], params["country"], Date.today)
      @city_in_country = Item.country_query(params["country"], Date.today)
      @cities =cities(@city_in_country)
      @country = @filtered_items.sample.country if !@filtered_items.empty?
    elsif params["search_location"] && params["search_location"] != ""
      @filtered_items = Item.string_query((params["search_location"].split(",")[0].strip), Date.today)
      @cities =cities(@filtered_items)
      @country = @filtered_items.sample.country if !@filtered_items.empty?
    else
      @items = Item.all
      @countries = countries(@items)
    end
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
     redirect_to user_dashboard_path(current_user.id)
    else
     redirect_to new_item_path
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    @item.save
    if @item.save
      redirect_to user_dashboard_path(current_user.id)
    else
     redirect_to edit_item_path(@item.id)
    end
  end

  def destroy
    @item.delete
    redirect_to user_dashboard_path(current_user.id)
  end

  private

  def cities(items)
    cities = []
    if !items.empty?
      items.each do |element|
        cities << element.city
      end
    end
    cities.uniq
  end


  def countries(items)
    countries = []
    items.each do |element|
      countries << element.country
    end
    countries.uniq
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :location, :available_from, :available_to, :photo, :search_location)
  end
end
