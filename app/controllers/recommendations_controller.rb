class RecommendationsController < ApplicationController
  # GET /recomendations
  # GET /recomendations.json
  def index
    @recommendations = Recommendation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recommendations }
    end
  end

  # GET /recomendations/1
  # GET /recomendations/1.json
  def show
    @recommendation = Recommendation.find(params[:id])
    @approvals = @recomendation.approvals.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recommendation }
    end
  end

  # GET /recomendations/new
  # GET /recomendations/new.json
  def new
    @recommendation = Recommendation.new
    
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
    #@recommendation.approval.new(:approved => false)
    respond_to do |format|
      if @recommendation.save
        format.html { redirect_to @recommendation, notice: 'Recommendation was successfully created.' }
        format.json { render json: @recommendation, status: :created, location: @recommendation }
      else
        format.html { render action: "new" }
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
