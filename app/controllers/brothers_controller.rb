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

  def new
    @brother = Brother.new
    @families = Family.all
    @rush_classes = RushClass.all
  end

  def create
    @brother = Brother.create(brother_params)
    if @brother.save
      redirect_to @brother, notice: 'Successfully created brother!'
    end
  end

  private
  def brother_params
    params.require(:brother).permit(
      :first_name, :last_name, :family_id, :rush_class_id, :parent_id, :status
    )
  end
end
