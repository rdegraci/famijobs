class ProfilesController < ApplicationController

  # Devise
  before_filter :authenticate_user! if Rails.env == 'production' || Rails.env == 'development'
  
  
  # Remove index method since it will be replaced by
  # AdminProfilesController
    

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    begin
      @profile = Profile.find(params[:id])
      @profile = current_user.profile
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @profile }
      end
    rescue
      redirect_to :new_profile
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    begin
      @profile = Profile.find(params[:id])
      @profile = current_user.profile
    rescue
      redirec_to :root
    end
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        current_user.profile = @profile
        current_user.save
        format.html { redirect_to @profile, :notice => 'Profile was successfully created.' }
        format.json { render :json => @profile, :status => :created, :location => @profile }
      else
        format.html { render :action => "new" }
        format.json { render :json => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    begin
      @profile = Profile.find(params[:id])
      @profile = current_user.profile
    rescue
      redirect_to :root
      return
    end

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, :notice => 'Profile was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    begin
      @profile = Profile.find(params[:id])
      @profile = current_user.profile
      @profile.destroy
    rescue
      redirect_to :root
      return
    end

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :ok }
    end
  end
end
