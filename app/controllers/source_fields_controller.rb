class SourceFieldsController < ApplicationController

  # GET /source_fields/new
  # GET /source_fields/new.json
  def new

    @report = Report.find(params[:report_id])
    @source = Source.find(params[:source_id])
    get_source_fields(@source.name)
    @stg_source_field = StgSourceField.all    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @source_field }
    end
  end


  # POST /source_fields
  # POST /source_fields.json
  def create

    @report = Report.find(params[:report_id]) 
    @source_field = Source.new(params[:source_field])
    @source_field.object_type = StgSource.find_by_name(@source_field.name[1]).object_type

    @source_field = @report.source_fields.create(name: @source_field.name[1], description: @source_field.description, object_type: @source_field.object_type)

    redirect_to report_source_fields_path(@report)
  end


  private
    def get_source_fields(tablename)

      ActiveRecord::Base.connection.execute("TRUNCATE table stg_source_fields")
        cursor ||= ''
      OraConnect.transaction do
          conn = OraConnect.connection.raw_connection
          cursor = conn.parse('BEGIN RDF_pkg.Return_source_fields(:TABLENAME, :OBJECTS); END;')
          cursor.bind_param(1, tablename)
          cursor.bind_param(2, nil, String, 4000)
          cursor.exec()
      end
      cursor[2].split(/;/).each do |i|
         @stg_source_field = StgSourceField.new(name:   i.split(/,/)[0], 
                                date_type:   i.split(/,/)[1],
                              description:   i.split(/,/)[2])
         @stg_source_field.save
      end   
      
    end  

end