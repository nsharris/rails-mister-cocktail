class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    #@ingredient = Ingredient.find(params[:ingredient][:id])
    @dose.cocktail = @cocktail
    #@dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render "new", dose: @dose
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
