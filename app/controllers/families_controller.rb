class FamiliesController < ApplicationController
  def show
    @family = Family.find(params[:id])
    @brothers = Brother.where(family_id: @family.id).order(:last_name)
    @brother_dict = {}
    @brothers.each do |brother|
      first_letter = brother.last_name[0].downcase.to_sym
      @brother_dict[first_letter] = [] if @brother_dict[first_letter].nil?
      @brother_dict[first_letter].push(brother)
    end
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.create(family_params)
    if @family.save
      redirect_to @family, notice: 'Successfully created new family'
    end
  end

  private
  def family_params
    params.require(:family).permit(:name)
  end
end
