class PagesController < ApplicationController
  before_filter :determine_format
  
  before_filter :authenticate_user!, :except => [:home, :prizes, :overview, :awards, :question, :photos_video, :export]
  before_filter :user_is_admin, :only => [:show, :index] 
  before_filter :inbox_value, :if_recommendations
  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new

    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to pages_path, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to pages_path, notice: 'Page was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :ok }
    end
  end
  
  def home
 @page = Page.find_by_name("Home")
 respond_to do |format|                                                                                                                                     
   format.html  { render 'home'}                                                                                                                             
   format.mobile { render 'home', :formats => [:html]}                                                                                      
 end
  end
  
  def prizes
    @page = Page.find_by_name("Prizes")
    @pages = Page.all
  end
  
  def overview
    @page = Page.find_by_name("Overview")
  end
  
  def awards
     @corpcat = Category.find(2)
     @corp = @corpcat.awards.order("name ASC")
     @storecat = Category.find(3)
     @store = @storecat.awards.order("name ASC")
     
     @cat4 = Category.find(4)
     @page = Page.find_by_name("Awards")            

     @award15 = Award.find(15)
     @award24 = Award.find(24)
  end
  
  def admin
    @pages = Page.all
  end 
  
  def users_list
    @users = User.order("last_name ASC")
  end 
  
  def inbox
    @approvals = Approval.where(:email => current_user.email , :approved => nil)
  end
  
  def location

   end
  def admin_awards
     @awards = Award.all
     @stores = Category.find(1)
  end
  
  def admin_recommendations    
    @recommendations = Recommendation.order("nominee ASC")
    @category = Category.find(1)
    
  end 
  
  def question
    @question = Question.new
    
  end 

  def thankyou
  end 
  
  def recs
    @recommendations = Recommendation.where("user_id = ?", current_user.id)
    @category = Category.find(1)
  end 
  
 def photos_video
   @videos = Video.all
 end 
  
  def export
    @recommendations = Recommendation.order(:nominee)
    respond_to do |format|
      format.xls
    end 
  end
  
  
 
end
