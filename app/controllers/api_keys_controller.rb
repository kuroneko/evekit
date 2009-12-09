class ApiKeysController < ApplicationController
	before_filter :require_user, :only => [:index, :show, :new, :edit, :create, :destroy]
	
	# GET /api_keys
  	# GET /api_keys.xml
	def index
		@user = current_user
		@api_keys = @user.api_keys
		
		respond_to do |format|
      		format.html # index.html.erb
      		format.xml  { render :xml => @api_keys }
    	end
  	end

  	# GET /api_keys/1
  	# GET /api_keys/1.xml
  	def show
	    @api_key = ApiKey.find(params[:id])
	    respond_to do |format|
		    if @api_key.user == current_user then
		      	format.html # show.html.erb
	    	  	format.xml  { render :xml => @api_key }
    	  	else
    	  		@api_key = ApiKey.new()
    	  		flash[:notice] = 'You do not have permission to view this API Key'
		        format.html { render :action => "new" }
        		format.xml  { render :xml => @api_key.errors, :status => :unprocessable_entity }
        	end
	    end
  	end

  # GET /api_keys/new
  # GET /api_keys/new.xml
  def new
    @api_key = ApiKey.new
	@api_key.user = current_user
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @api_key }
    end
  end

  # GET /api_keys/1/edit
  def edit
    @api_key = ApiKey.find(params[:id])
  end

  # POST /api_keys
  # POST /api_keys.xml
  def create
    @api_key = ApiKey.new(params[:api_key])
    # force key ownership.
    @api_key.user = current_user
    
    respond_to do |format|
      if @api_key.save
        flash[:notice] = 'ApiKey was successfully created.'
        format.html { redirect_to(@api_key) }
        format.xml  { render :xml => @api_key, :status => :created, :location => @api_key }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @api_key.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /api_keys/1
  # PUT /api_keys/1.xml
  def update
    @api_key = ApiKey.find(params[:id])

    respond_to do |format|
      if @api_key.user == current_user && @api_key.update_attributes(params[:api_key])
        flash[:notice] = 'ApiKey was successfully updated.'
        format.html { redirect_to(@api_key) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @api_key.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /api_keys/1
  # DELETE /api_keys/1.xml
  def destroy
    @api_key = ApiKey.find(params[:id])
    

    respond_to do |format|
		if (@api_key.user == current_user)
    		@api_key.destroy
      		format.html { redirect_to(api_keys_url) }
			format.xml  { head :ok }
		else
			flash[:notice] = 'No permission to delete ApiKey'
      		format.html { redirect_to(api_keys_url) }
			format.xml  { head :failed }
		end		
    end
  end
end
