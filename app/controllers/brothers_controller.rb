class BrothersController < ApplicationController
  def index
    @brothers = Brother.all.order(:last_name)
    @brother_dict = {}
    @brothers.each do |brother|
      first_letter = brother.last_name[0].downcase.to_sym
      @brother_dict[first_letter] = [] if @brother_dict[first_letter].nil?
      @brother_dict[first_letter].push(brother)
    end
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
        d.full_name, d.parent.full_name, ""
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

  def edit
    @brother = Brother.find(params[:id])
  end

  def update
    @brother = Brother.find(params[:id])

    if @brother.update_attributes(brother_params)
      redirect_to :action => 'show', id: @brother.id
    else
      render :action => 'edit'
    end
  end

  private
  def brother_params
    params.require(:brother).permit(
      :first_name, :last_name, :family_id, :rush_class_id, :parent_id, :status
    )
  end
end
