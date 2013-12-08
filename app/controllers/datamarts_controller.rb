class DatamartsController < ApplicationController

  def index

    @datamarts = Datamart.order(:data_id, :baccount_id, :customer_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @datamarts }
    end
  end
end  