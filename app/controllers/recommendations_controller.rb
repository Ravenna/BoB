class RecommendationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :inbox_value, :if_recommendations
  before_filter :user_is_admin, :only => [:show] 
  
  # GET /recomendations
  # GET /recomendations.json
  def index
    @recommendations = Recommendation.order("nominee ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recommendations }
    end
  end

  # GET /recomendations/1
  # GET /recomendations/1.json
  def show
    @recommendation = Recommendation.find(params[:id])
    @approvals = @recommendation.approvals.find(:all, :order => "created_at ASC")
    @rec_user = User.find(:first, :conditions => ["id = ?", @recommendation.user_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recommendation }
    end
  end

  # GET /recomendations/new
  # GET /recomendations/new.json
  def new
    @award = Award.find(params[:award_id])
    @category = Category.find(params[:category_id])
    @recommendation = Recommendation.new
    
    @recommendation.approvals.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recommendation }
    end
  end

  # GET /recomendations/1/edit
  def edit
    @recommendation = Recommendation.find(params[:id])
  end

  # POST /recomendations
  # POST /recomendations.json
  def create
    @recommendation = Recommendation.new(params[:recommendation])
    @recommendation.user_id = current_user.id
 

    respond_to do |format|
      if @recommendation.save
        format.html { redirect_to thankyou_path, notice: 'Recommendation was successfully created.' }
      else
        format.html { redirect_to new_category_award_recommendation_path(@category, @award)}
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
        
      end
    end
  end

  # PUT /recomendations/1
  # PUT /recomendations/1.json
  def update
    @recommendation = Recommendation.find(params[:id])

    respond_to do |format|
      if @recommendation.update_attributes(params[:recommendation])
        format.html { redirect_to @recommendation, notice: 'Recommendation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recomendations/1
  # DELETE /recomendations/1.json
  def destroy
    @recommendation = Recommendation.find(params[:id])
    @recommendation.destroy

    respond_to do |format|
      format.html { redirect_to recommendations_url }
      format.json { head :ok }
    end
  end
end
