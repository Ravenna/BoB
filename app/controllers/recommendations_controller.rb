class RecommendationsController < ApplicationController
  before_filter :determine_format
  
  before_filter :authenticate_user!
  before_filter :inbox_value, :if_recommendations
  # before_filter :user_is_admin, :only => [:show] 
  
  # GET /recommendations
  # GET /recommendations.json
  
  def index
    @recommendations = Recommendation.order("nominee ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recommendations }
    end
  end

  # GET /recommendations/1
  # GET /recommendations/1.json
  def show
    @recommendation = Recommendation.find(params[:id])
    @approvals = @recommendation.approvals.find(:all, :order => "created_at ASC")
    @rec_user = User.find(@recommendation.user_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recommendation }
    end
  end

  # GET /recommendations/new
  # GET /recommendations/new.json
  def new
    @award = Award.find(params[:award_id])
    @category = Category.find(params[:category_id])
    @recommendation = Recommendation.new
    6.times {@recommendation.assets.build}
    
    @recommendation.approvals.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recommendation }
    end
  end

  # GET /recommendations/1/edit
  def edit
    @recommendation = Recommendation.find(params[:id])
    @recommendation.approvals.build
    @award = Award.find(params[:award_id])
    @category = Category.find(params[:category_id])
    @assets = @recommendation.assets.all
    if @assets.empty?
      6.times {@recommendation.assets.build}
    else
      asset_loop = 6 - @assets.count  
      asset_loop.times {@recommendation.assets.build}
    end   
  end

  # POST /recommendations
  # POST /recommendations.json
  def create
    @recommendation = Recommendation.new(params[:recommendation])
    @recommendation.user_id = current_user.id


    respond_to do |format|
      if @recommendation.save
        format.html { redirect_to thankyou_path, notice: 'Recommendation was successfully created.' }
      else
        format.html { render action: "new"  }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
        
      end
    end
  end

  # PUT /recommendations/1
  # PUT /recommendations/1.json
  def update
    @recommendation = Recommendation.find(params[:id])

    respond_to do |format|
      if @recommendation.update_attributes(params[:recommendation])
        format.html { redirect_to recs_path, notice: 'Recommendation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recommendations/1
  # DELETE /recommendations/1.json
  def destroy
    @recommendation = Recommendation.find(params[:id])
    @recommendation.destroy

    respond_to do |format|
      format.html { redirect_to admin_recommendations_path, notice: 'Recommendation deleted.'  }
      format.json { head :ok }
    end
  end
  
  
  protected
       def is_valid_email?(address)
         Email.find_by_email(address)
       end
end
