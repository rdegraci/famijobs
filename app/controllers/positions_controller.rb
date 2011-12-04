class PositionsController < ApplicationController
  
  # Devise
  before_filter :authenticate_user!

  # GET /positions
  # GET /positions.json
  def index
    begin
      @positions = current_user.positions
    rescue
      @positions = []
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @positions }
    end
  end

  # GET /positions/1
  # GET /positions/1.json
  def show
    @position = Position.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @position }
    end
  end

  # GET /positions/new
  # GET /positions/new.json
  def new
    @position = Position.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @position }
    end
  end

  # GET /positions/1/edit
  def edit
    begin
      @position = current_user.positions.find(params[:id])
    rescue
      redirect_to :root
    end
  end

  # POST /positions
  # POST /positions.json
  def create
    @position = Position.new(params[:position])

    respond_to do |format|
      if @position.save
        current_user.positions << @position
        current_user.save
        format.html { redirect_to @position, :notice => 'Position was successfully created.' }
        format.json { render :json => @position, :status => :created, :location => @position }
      else
        format.html { render :action => "new" }
        format.json { render :json => @position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /positions/1
  # PUT /positions/1.json
  def update
    begin
      @position = current_user.positions.find(params[:id])
    rescue
      redirect_to :root
    end
    
    respond_to do |format|
      if @position.update_attributes(params[:position])
        format.html { redirect_to @position, :notice => 'Position was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
    begin
      @position = current_user.positions.find(params[:id])
      @position.destroy
    rescue
      redirect_to :root
    end
    
    respond_to do |format|
      format.html { redirect_to positions_url }
      format.json { head :ok }
    end
  end
    
  # Apply for a collection of Positions
  # PUT /positions/apply
  def apply
   #logger.info (">>>>#{params.inspect}<<<<")
   positions_hash = params[:position]
   positions_hash.each_key do |key|
     internal_hash = positions_hash[key] 
     is_applied = internal_hash['applied']
     if is_applied == '1'
       job_position = Position.find key.to_i
       job_position.applicants << current_user
       job_position.save
     end
   end
   redirect_to :root
  end
  
  # Unapply from a collection of Positions
  # PUT /positions/unapply
  def unapply
   redirect_to :root
  end
  
end
