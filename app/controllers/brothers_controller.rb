class BrothersController < ApplicationController
  def index
    @brothers = Brother.all
    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @brothers } # handle JSON calls for searching
    end
  end

  def show
    @brother = Brother.find(params[:id])
    @org_chart_data = []
    @brother.descendants.each do |d|
      @org_chart_data.push([
        d.full_name, d.parent.full_name,""
      ])
    end
  end
end
