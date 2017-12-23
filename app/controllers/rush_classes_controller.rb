class RushClassesController < ApplicationController
  def index
    @rush_classes = RushClass.all.order(:year)
  end

  def show
    @rush_class = RushClass.find(params[:id])
    @class_members = Brother.where({ rush_class_id: params[:id] })
  end

  def new
    @rush_class = RushClass.new
  end

  def create
    @rush_class = RushClass.create(rush_class_params)
    if @rush_class.save
      redirect_to @rush_class, notice: "Successfully created rush class!"
    end
  end

  def edit
    @rush_class = RushClass.find(params[:id])
  end

  def update
    @rush_class = RushClass.find(params[:id])

    if @rush_class.update_attributes(rush_class_params)
      redirect_to :action => "show", id: @rush_class.id
    else
      render :action => "edit"
    end
  end

  def destroy
    if RushClass.destroy(params[:id])
      redirect_to '/rush_classes', notice: "Rush class successfully destroyed"
    else
      redirect_to @rush_class, notice: "Error: Could not delete rush class"
    end
  end

  private
  def rush_class_params
    params.require(:rush_class).permit(
      :greek_name, :year, :semester
    )
  end
end
