class SourcesController < ApplicationController
  # GET /sources
  # GET /sources.json
  def index
    @sources = Source.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sources }
    end
  end

  # GET /sources/new
  # GET /sources/new.json
  def new
    get_sources
    @stg_source = StgSource.all
    @report = Report.find(params[:report_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @source }
    end
  end

  # GET /sources/1/edit
  def edit
    @source = Source.find(params[:id])
  end

  # POST /sources
  # POST /sources.json
  def create

    @report = Report.find(params[:report_id]) 
    @source = Source.new(params[:source])
    @source.object_type = StgSource.find_by_name(@source.name).object_type

    @source = @report.sources.create(name: @source.name[1], description: @source.description, object_type: @source.object_type)

    redirect_to report_source_new_source_field_path(@report, @source)
  end

  # PUT /sources/1
  # PUT /sources/1.json
  def update
    @source = Source.find(params[:id])

    respond_to do |format|
      if @source.update_attributes(params[:source])
        format.html { redirect_to edit_source_path, notice: 'Source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sources/1
  # DELETE /sources/1.json
  def destroy
    @source = Source.find(params[:id])
    @source.destroy

    respond_to do |format|
      format.html { redirect_to sources_url }
      format.json { head :no_content }
    end
  end

  private
    def get_sources

      ActiveRecord::Base.connection.execute("TRUNCATE table stg_sources")
        cursor ||= ''
      OraConnect.transaction do
          conn = OraConnect.connection.raw_connection
          cursor = conn.parse('BEGIN RDF_pkg.Return_sources(:OBJECTS); END;')
          cursor.bind_param(1, nil, String, 4000)
          cursor.exec()
      end
      cursor[1].split(/;/).each do |i|
         @stg_source = StgSource.new(name: i.split(/,/)[0], 
                              object_type: i.split(/,/)[1],
                              description: i.split(/,/)[2])
         @stg_source.save
      end   
      
    end

end
