class ApiKeysController < ApplicationController
  before_filter :require_user

  # GET /api_keys
  def index
    @user = @current_user
    @api_keys = @user.api_keys
    render
  end

  # GET /api_keys/1
  def show
    @api_key = ApiKey.find(params[:id])
    if @api_key.user == @current_user then
      render
    else
      flash[:notice] = 'You do not have permission to view this API Key'
      redirect_to(:index);
    end
  end

  # GET /api_keys/new
  # GET /api_keys/new.xml
  def new
    @api_key = ApiKey.new
    @api_key.user = @current_user
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
  def create
    @api_key = ApiKey.new(params[:api_key])
    # force key ownership.
    @api_key.user = @current_user

    if @api_key.save
      flash[:notice] = 'ApiKey was successfully created.'
      redirect_to(@api_key)
    else
      render :action => "new"
    end
  end

  # PUT /api_keys/1
  def update
    @api_key = ApiKey.find(params[:id])

    if @api_key.user == @current_user && @api_key.update_attributes(params[:api_key])
      flash[:notice] = 'ApiKey was successfully updated.'
      redirect_to(@api_key)
    else
      render :action => "edit"
    end
  end

  # DELETE /api_keys/1
  def destroy
    @api_key = ApiKey.find(params[:id])

    if (@api_key.user == @current_user)
      @api_key.destroy
      redirect_to(api_keys_url)
    else
      flash[:notice] = 'No permission to delete API Key'
      redirect_to(api_keys_url)
    end
  end
end
