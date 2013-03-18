class BigGeneratorsController < ApplicationController
  # GET /big_generators
  # GET /big_generators.json
  def index
    @big_generators = BigGenerator.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @big_generators }
    end
  end

  # GET /big_generators/1
  # GET /big_generators/1.json
  def show
    @big_generator = BigGenerator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @big_generator }
    end
  end

  # GET /big_generators/new
  # GET /big_generators/new.json
  def new
    @big_generator = BigGenerator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @big_generator }
    end
  end

  # GET /big_generators/1/edit
  def edit
    @big_generator = BigGenerator.find(params[:id])
  end

  # POST /big_generators
  # POST /big_generators.json
  def create
    @big_generator = BigGenerator.new(params[:big_generator])

    respond_to do |format|
      if @big_generator.save
        format.html { redirect_to @big_generator, notice: 'Big generator was successfully created.' }
        format.json { render json: @big_generator, status: :created, location: @big_generator }
      else
        format.html { render action: "new" }
        format.json { render json: @big_generator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /big_generators/1
  # PUT /big_generators/1.json
  def update
    @big_generator = BigGenerator.find(params[:id])

    respond_to do |format|
      if @big_generator.update_attributes(params[:big_generator])
        format.html { redirect_to @big_generator, notice: 'Big generator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @big_generator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /big_generators/1
  # DELETE /big_generators/1.json
  def destroy
    @big_generator = BigGenerator.find(params[:id])
    @big_generator.destroy

    respond_to do |format|
      format.html { redirect_to big_generators_url }
      format.json { head :no_content }
    end
  end
end
