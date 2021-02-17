class PuppiesController < ApplicationController
  before_action :set_puppy, only: [:show]

  def index
    @puppies = Puppy.all
  end

  def show
  end

  private
    def set_puppy
      @puppy = Puppy.find(params[:id])
    end
end
