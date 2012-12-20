class AwardsController < ApplicationController
  before_filter :determine_format
  before_filter :inbox_value, :if_recommendations
  # GET /awards
  # GET /awards.json
  def index
    @awards = Award.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @awards }
    end
  end

  # GET /awards/1
  # GET /awards/1.json
  def show
    @award = Award.find(params[:id])
    @category = Category.find(params[:category_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @award }
    end
  end


  def new
    @award = Award.new
  end

  def edit
    @award = Award.find(params[:id])
  end


  def create
    @award = Award.new(params[:award])
    respond_to do |format|
      if @award.save
        format.html { redirect_to admin_awards_path, notice: 'Award was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /awards/1
  # PUT /awards/1.json
  def update
    @award = Award.find(params[:id])

    respond_to do |format|
      if @award.update_attributes(params[:award])
        format.html { redirect_to admin_awards_path, notice: 'Award was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @award.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /awards/1
  # DELETE /awards/1.json
  def destroy
    @award = Award.find(params[:id])
    @award.destroy

    respond_to do |format|
      format.html { redirect_to admin_awards_url }
      format.json { head :ok }
    end
  end
end
