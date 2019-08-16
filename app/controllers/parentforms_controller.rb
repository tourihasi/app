class ParentformsController < ApplicationController
  def new
    @parentform = ParentForm.new
  end

  def create
    @parentform = ParentForm.new(parentform_params)
    @parentform.user_name = current_user.name
    @parentform.save
    redirect_to parentforms_path
  end

  def show
    binding.pry
    @parentform = ParentForm.find(params[:id])
    @childforms = ChildForm.where(parent_id: params[:id])
  end

  def edit
  end

  def delete
  end

  def index
    @parentforms = ParentForm.all
  end

  private 
  def parentform_params
    params.require(:parent_form).permit(:name,:user_name,:user_id,:image)
  end
end
