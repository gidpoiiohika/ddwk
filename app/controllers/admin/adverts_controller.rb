class Admin::AdvertsController < AdminController
  before_action :set_advert, only: [:show, :edit, :update, :destroy]

  def index
    @adverts = Advert.all
  end

  def show
  end

  def new
    @advert = Advert.new
  end

  def edit
  end

  def create
    @advert = Advert.new(advert_params)

    respond_to do |format|
      if @advert.save
        format.html { redirect_to admin_adverts_path, notice: 'Advert was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @advert.update(advert_params)
        format.html { redirect_to admin_adverts_path, notice: 'Advert was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @advert.destroy
    redirect_to admin_adverts_path, notice: 'Advert was successfully destroyed.'
  end

  private
    def set_advert
      @advert = Advert.find(params[:id])
    end

    def advert_params
      params.require(:advert).permit(:name, :description, :role, :first_name, :last_name)
    end
end
