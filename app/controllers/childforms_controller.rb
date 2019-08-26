class ChildformsController < ApplicationController
  def new
    @childform = ChildForm.new
    @parentform = ParentForm.find(params[:parentform_id])
  end

  def create
    @childform = ChildForm.new(childform_params)
    @childform.user_id = current_user.id
    @childform.parent_form_id = params[:parentform_id]
    if @childform.save
      redirect_to parentform_path(params[:parentform_id])
    else  
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private
  def childform_params
    params.require(:child_form).permit(:name,:revision,:reson,:parent_form_id,:image)
  end
end
