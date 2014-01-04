class DatamartsController < ApplicationController

  def index

    @levels_all = DmStructure.all
    #@datamarts = Datamart.order("#{DmStructure.ord}")
    @datamarts = Datamart.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @datamarts }
    end
  end
end  