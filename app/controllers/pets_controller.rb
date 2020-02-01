class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    pet = Pet.create(name: params[:pet_name],
      description: params[:pet_description],
      approximate_age: params[:pet_approximate_age],
      sex: params[:pet_sex], adoption_status: "adoptable",
      shelter_id: params[:id], shelter_name: Shelter.find(params[:id]).name)
    redirect_to "/shelters/#{params[:id].to_i}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end
end
