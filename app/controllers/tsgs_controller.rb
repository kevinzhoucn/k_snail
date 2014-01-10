class TsgsController < ApplicationController
  # GET /tsgs
  # GET /tsgs.json
  def index
    @tsgs = Tsg.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tsgs }
    end
  end

  # GET /tsgs/1
  # GET /tsgs/1.json
  def show
    @tsg = Tsg.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tsg }
    end
  end

  # GET /tsgs/new
  # GET /tsgs/new.json
  def new
    @tsg = Tsg.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tsg }
    end
  end

  # GET /tsgs/1/edit
  def edit
    @tsg = Tsg.find(params[:id])
  end

  # POST /tsgs
  # POST /tsgs.json
  def create
    @tsg = Tsg.new(params[:tsg])

    respond_to do |format|
      if @tsg.save
        format.html { redirect_to @tsg, notice: 'Tsg was successfully created.' }
        format.json { render json: @tsg, status: :created, location: @tsg }
      else
        format.html { render action: "new" }
        format.json { render json: @tsg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tsgs/1
  # PUT /tsgs/1.json
  def update
    @tsg = Tsg.find(params[:id])

    respond_to do |format|
      if @tsg.update_attributes(params[:tsg])
        format.html { redirect_to @tsg, notice: 'Tsg was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tsg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tsgs/1
  # DELETE /tsgs/1.json
  def destroy
    @tsg = Tsg.find(params[:id])
    @tsg.destroy

    respond_to do |format|
      format.html { redirect_to tsgs_url }
      format.json { head :no_content }
    end
  end
end
