class Admin::PuppiesController < ApplicationController
  before_action :set_puppy, only: [:show, :edit, :update, :destroy]

  def index
    @puppies = Puppy.all
  end

  def show
  end

  def new
    @puppy = Puppy.new
  end

  def edit
  end

  def create
    @puppy = Puppy.new(puppy_params)

    respond_to do |format|
      if @puppy.save
        format.html { redirect_to admin_puppies_path, notice: 'Puppy was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @puppy.update(puppy_params)
        format.html { redirect_to admin_puppies_path, notice: 'Puppy was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @puppy.destroy
    respond_to do |format|
      format.html { redirect_to admin_puppies_path, notice: 'Puppy was successfully destroyed.' }
    end
  end

  private
    def set_puppy
      @puppy = Puppy.find(params[:id])
    end

    def puppy_params
      params.require(:puppy).permit(:name, :descriptin, :date_of_birth)
    end
end
