class Admin::ProgessesController < Admin::BaseController
  load_and_authorize_resource

  before_action :load_progesses, only: [:index, :update, :destroy]

  def index
    @progess = Progess.new
  end

  def create
    if @progess.save
      flash[:success] = t :create_success
      redirect_to admin_progesses_path
    else
      load_progesses
      render :index
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @progess.update_attributes progess_params
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @progess.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def progess_params
    params.require(:progess).permit :name
  end

  def load_progesses
    @progesses = Progess.page params[:page]
  end
end
