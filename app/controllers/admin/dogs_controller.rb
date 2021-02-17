class Admin::DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  def index
    @dogs = Dog.all
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def edit
  end

  def create
    @dog = Dog.new(dog_params)

    respond_to do |format|
      if @dog.save
        format.html { redirect_to admin_dogs_path, notice: 'Dog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to admin_dogs_path, notice: 'Dog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @dog.destroy
    respond_to do |format|
      format.html { redirect_to admin_dogs_path, notice: 'Dog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_dog
      @dog = Dog.find(params[:id])
    end

    def dog_params
      params.require(:dog).permit(:name, :descriptin)
    end
end
