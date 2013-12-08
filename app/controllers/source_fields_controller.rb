class SourceFieldsController < ApplicationController

  # GET /source_fields/new
  # GET /source_fields/new.json
  def new

    @report = Report.find(params[:report_id])
    @source = Source.find(params[:source_id])
    get_source_fields(@source.name, @source.owner)
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
    @source = Source.find(params[:source_id])

    params[:source_fields].each do |field|
     @source_field = SourceField.create(name:        field[:name], 
                                        date_type:   field[:date_type],
                                        description: field[:description], 
                                        source_id:   params[:source_id]) if field[:box]
    end
   unless SourceField.find_by_source_id(@source.id).nil?
      redirect_to report_sources_path(@report)
   else   
      @stg_source_field = StgSourceField.all
      render action: "new"
   end
  end


  private
    def get_source_fields(tablename, owner)

      ActiveRecord::Base.connection.execute("TRUNCATE table stg_source_fields")
        cursor ||= ''
      OraConnect.transaction do
          conn = OraConnect.connection.raw_connection
          cursor = conn.parse('BEGIN RDF_pkg.Return_source_fields(:TABLENAME, :OWNER, :OBJECTS); END;')
          cursor.bind_param(1, tablename)
          cursor.bind_param(2, owner)
          cursor.bind_param(3, nil, String)
          cursor.exec()
      end
      cursor[3].split(/#/).each do |i|
         @stg_source_field = StgSourceField.new(name:        i.split(/,/)[0], 
                                           date_type:        i.split(/,/)[1],
                                           data_length:      i.split(/,/)[2],
                                           data_precigion:   i.split(/,/)[3],
                                           data_scale:       i.split(/,/)[4],
                                           description:      i.split(/,/)[5])
         @stg_source_field.save
      end   
      
    end  

end