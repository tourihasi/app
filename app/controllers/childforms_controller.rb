class ChildformsController < ApplicationController
  def new
    @childform = ChildForm.new
    @parentform = ParentForm.find(params[:parentform_id])
  end

  def create
    binding.pry
    @childform = ChildForm.new(childform_params)
    @childform.user_id = current_user.id
    @childform.parentform_id = params[:parentform_id]
    @childform.save!
    redirect_to parentform_path(params[:parentform_id])
  end

  def edit
  end

  def update
  end

  def delete
  end

  private
  def childform_params
    params.require(:child_form).permit(:name,:user_name,:revision,:reson,:user_id,:image)
  end
end
