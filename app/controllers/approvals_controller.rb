class ApprovalsController < ApplicationController
  before_filter :determine_format
  before_filter :authenticate_user!
  before_filter :inbox_value, :if_recommendations
  # GET /approvals
  # GET /approvals.json
  def index
    @approvals = Approval.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @approvals }
    end
  end

  # GET /approvals/1
  # GET /approvals/1.json
  def show
    @approval = Approval.find(params[:id])

    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @approval }
    end
  end

  # GET /approvals/new
  # GET /approvals/new.json
  def new
    @approval = Approval.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @approval }
    end
  end

  # GET /approvals/1/edit
  def edit
    @approval = Approval.find(params[:id])
  end

  # POST /approvals
  # POST /approvals.json
  def create
    @approval = Approval.new(params[:approval])

    respond_to do |format|
      if @approval.save
        format.html { redirect_to @approval, notice: 'Approval was successfully created.' }
        format.json { render json: @approval, status: :created, location: @approval }
      else
        format.html { render action: "show" }
        format.json { render json: @approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /approvals/1
  # PUT /approvals/1.json
  def update
    @approval = Approval.find(params[:id])

    respond_to do |format|
      if @approval.update_attributes(params[:approval])
        format.html { redirect_to root_path, notice: 'Thanks for Approving/Declining the Recommendation' }
        format.json { head :ok }
      else
        format.html { render action: "show" }
        format.json { render json: @approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /approvals/1
  # DELETE /approvals/1.json
  def destroy
    @approval = Approval.find(params[:id])
    @approval.destroy

    respond_to do |format|
      format.html { redirect_to approvals_url }
      format.json { head :ok }
    end
  end
  
  def toggle_decline
      @approval = Approval.find(params[:id])
      @approval.decline = true
      respond_to do |format|
         if @approval.update_attributes(params[:approval])
            format.html { redirect_to recommendations_path, notice: 'Approval was successfully made.' }
            format.json { head :ok }
          else
            format.html { render action: "edit" }
            format.json { render json: @approval.errors, status: :unprocessable_entity }
          end
      end 
  end
end
