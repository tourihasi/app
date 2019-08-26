class ParentformsController < ApplicationController
  def new
    @parentform = ParentForm.new
  end

  def create
    @parentform = ParentForm.new(parentform_params)
    @parentform.user_id = current_user.id
    if @parentform.save
      redirect_to parentforms_path
    else   
      render :new
    end
  end

  def show
    @parentform = ParentForm.find(params[:id])
    @childforms = ChildForm.where(parent_form_id: params[:id])
  end

  def edit
  end

  def destroy
    @parentform = ParentForm.find(params[:id])
    if @parentform.destroy
      redirect_to parentforms_path
    else
      render parentforms_path
    end
  end

  def index
    @parentforms = ParentForm.all
  end

  private 
  def parentform_params
    params.require(:parent_form).permit(:name,:image)
  end
end
