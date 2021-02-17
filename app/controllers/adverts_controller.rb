class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show]

  def index
    @adverts = Advert.all
  end

  def show
  end

  private
    def set_advert
      @advert = Advert.find(params[:id])
    end
end
