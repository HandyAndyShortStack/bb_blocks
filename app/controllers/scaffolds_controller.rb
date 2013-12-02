class ScaffoldsController < ApplicationController
  # GET /scaffolds
  # GET /scaffolds.json
  def index
    @scaffolds = Scaffold.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scaffolds }
    end
  end

  # GET /scaffolds/1
  # GET /scaffolds/1.json
  def show
    @scaffold = Scaffold.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scaffold }
    end
  end

  # GET /scaffolds/new
  # GET /scaffolds/new.json
  def new
    @scaffold = Scaffold.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scaffold }
    end
  end

  # GET /scaffolds/1/edit
  def edit
    @scaffold = Scaffold.find(params[:id])
  end

  # POST /scaffolds
  # POST /scaffolds.json
  def create
    @scaffold = Scaffold.new(params[:scaffold])

    respond_to do |format|
      if @scaffold.save
        format.html { redirect_to @scaffold, notice: 'Scaffold was successfully created.' }
        format.json { render json: @scaffold, status: :created, location: @scaffold }
      else
        format.html { render action: "new" }
        format.json { render json: @scaffold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scaffolds/1
  # PUT /scaffolds/1.json
  def update
    @scaffold = Scaffold.find(params[:id])

    respond_to do |format|
      if @scaffold.update_attributes(params[:scaffold])
        format.html { redirect_to @scaffold, notice: 'Scaffold was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scaffold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scaffolds/1
  # DELETE /scaffolds/1.json
  def destroy
    @scaffold = Scaffold.find(params[:id])
    @scaffold.destroy

    respond_to do |format|
      format.html { redirect_to scaffolds_url }
      format.json { head :no_content }
    end
  end
end
