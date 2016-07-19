class Admin::SkillsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @skills = @skills.page params[:page]
    @skill = Skill.new
  end

  def create
    if @skill.save
      flash[:success] = t :create_success
      redirect_to admin_skills_path
    else
      @skills = skill.page params[:page]
      render :index
    end
  end
  
  def edit
  end

  def update
    if @skill.update_attributes skill_params
      @skills = Skill.page params[:page]
      respond_to do |format|
        format.html {redirect_to admin_skills_path}
        format.js
      end
    end
  end

  def destroy
    @skill.destroy
    @skills = Skill.page params[:page]
    respond_to do |format|
      format.html {redirect_to admin_skills_path}
      format.js
    end
  end

  private
  def skill_params
    params.require(:skill).permit :name
  end
end
