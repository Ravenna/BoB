class CategoriesController < ApplicationController
  
    before_filter :inbox_value, :if_recommendations
  # GET /award_categories
  # GET /award_categories.json
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @award_categories }
    end
  end

  # GET /award_categories/1
  # GET /award_categories/1.json
  def show
      @corpcat = Category.find(2)
      @corp = @corpcat.awards.order("name ASC")
      
      @storecat = Category.find(3)
      @store = @storecat.awards.order("name ASC")

      @grovecat = Category.find(5)
      @grove = @grovecat.awards.order("name ASC")

      @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /award_categories/new
  # GET /award_categories/new.json
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /award_categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /award_categories
  # POST /award_categories.json
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Award category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /award_categories/1
  # PUT /award_categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: 'Award category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /award_categories/1
  # DELETE /award_categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :ok }
    end
  end
end
