class SmallGeneratorsController < ApplicationController
  # GET /small_generators
  # GET /small_generators.json
  def index
    @small_generators = SmallGenerator.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @small_generators }
    end
  end

  # GET /small_generators/1
  # GET /small_generators/1.json
  def show
    @small_generator = SmallGenerator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @small_generator }
      format.pdf do
        pdf = SmallGeneratorsPdf.new @small_generator, view_context
        send_data pdf.render,
                  type: "application/pdf",
                  disposition: "inline",
                  filename: "#{@small_generator.model}.pdf"
      end
    end
  end

  # GET /small_generators/new
  # GET /small_generators/new.json
  def new
    @small_generator = SmallGenerator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @small_generator }
    end
  end

  # GET /small_generators/1/edit
  def edit
    @small_generator = SmallGenerator.find(params[:id])
  end

  # POST /small_generators
  # POST /small_generators.json
  def create
    @small_generator = SmallGenerator.new(params[:small_generator])

    respond_to do |format|
      if @small_generator.save
        format.html { redirect_to @small_generator, notice: 'Small generator was successfully created.' }
        format.json { render json: @small_generator, status: :created, location: @small_generator }
      else
        format.html { render action: "new" }
        format.json { render json: @small_generator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /small_generators/1
  # PUT /small_generators/1.json
  def update
    @small_generator = SmallGenerator.find(params[:id])

    respond_to do |format|
      if @small_generator.update_attributes(params[:small_generator])
        format.html { redirect_to @small_generator, notice: 'Small generator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @small_generator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /small_generators/1
  # DELETE /small_generators/1.json
  def destroy
    @small_generator = SmallGenerator.find(params[:id])
    @small_generator.destroy

    respond_to do |format|
      format.html { redirect_to small_generators_url }
      format.json { head :no_content }
    end
  end
end
