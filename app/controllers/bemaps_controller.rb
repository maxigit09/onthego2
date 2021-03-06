class BemapsController < ApplicationController
  include BemapsHelper
  include CsvHelper
  #  GET /bemaps
  #  GET /bemaps.json
  def index
    @bemaps = Bemap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bemaps }
    end
  end

  # GET /bemaps/1
  # GET /bemaps/1.json
  def show
    @bemap = Bemap.find(params[:id])
    @bemap_polylines = []
    @bemap_characters = []
    @bemap.characters.each do |v|
      @bemap_characters << { :lng => v[:longitude], :lat => v[:latitude]}
    end
    @bemap_polylines << @bemap_characters
    @bemap_polylines =  @bemap_polylines.to_json
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bemap }
    end
  end

  # GET /bemaps/new
  # GET /bemaps/new.json
  def new
    @bemap = Bemap.new
    @show_controls = false
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bemap }
    end
  end

  # GET /bemaps/1/edit
  def edit
    @bemap = Bemap.find(params[:id])
    @show_controls = true
  end

  # POST /bemaps
  # POST /bemaps.json
  def create

    @bemap = Bemap.new(params[:bemap])
    #logger.info "PARAMS PARAMS PARAMS PARAMS PARAMS PARAMS PARAMS PARAMS PARAMS PARAMS"
    #logger.info test1
    #logger.info @bemap.atch_file_name
    #logger.info @bemap.atch.path
    #logger.info @bemap.atch.url

    respond_to do |format|
      if @bemap.save
        format.html { redirect_to @bemap, notice: 'Bemap was successfully created.' }
        format.json { render json: @bemap, status: :created, location: @bemap }
      else
        format.html { render action: "new" }
        format.json { render json: @bemap.errors, status: :unprocessable_entity }
      end
    end

    csv_rows = (getColumns @bemap.atch.path, ["longitude", "latitude"])
    csv_rows.each do |v|
      @character  = @bemap.characters.build(:longitude => v[1], :latitude => v[0], :gmaps => true)
      @character.save
    end
    flash[:valid_csv_measurements] = csv_rows.count

  end

  # PUT /bemaps/1
  # PUT /bemaps/1.json
  def update
    @bemap = Bemap.find(params[:id])

    respond_to do |format|
      if @bemap.update_attributes(params[:bemap])
        format.html { redirect_to @bemap, notice: 'Bemap was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @bemap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bemaps/1
  # DELETE /bemaps/1.json
  def destroy
    @bemap = Bemap.find(params[:id])
    @bemap.destroy

    respond_to do |format|
      format.html { redirect_to bemaps_url }
      format.json { head :ok }
    end
  end
end
