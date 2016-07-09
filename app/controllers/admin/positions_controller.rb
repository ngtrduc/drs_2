class Admin::PositionsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @positions = @positions.page params[:page]
    @position = Position.new
  end

  def create
    if @position.save
      flash[:success] = t :create_success
      redirect_to admin_positions_path
    else
      @positions = Position.page params[:page]
      render :index
    end
  end

  private
  def position_params
    params.require(:position).permit :name
  end
end
