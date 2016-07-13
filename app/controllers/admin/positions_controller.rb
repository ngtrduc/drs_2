class Admin::PositionsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @positions = @positions.page params[:page]
    @position = Position.new
  end

  def show
    @profiles = @position.profiles.page params[:page]
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
  
  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @position.update_attributes position_params
      @positions = Position.page params[:page]
      respond_to do |format|
        format.html {redirect_to admin_positions_path}
        format.js
      end
    end
  end

  def destroy
    @position.destroy
    @positions = Position.page params[:page]
    respond_to do |format|
      format.html {redirect_to admin_positions_path}
      format.js
    end
  end

  private
  def position_params
    params.require(:position).permit :name
  end
end
