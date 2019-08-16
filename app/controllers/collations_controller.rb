class CollationsController < ApplicationController
  def new
    @collation = Collation.new
    render 'new'
  end

  def create
    #binding.pry
    @collation = Collation.new(collation_params)
    @collation.user_name = current_user.name
    
    if @collation.save
      render 'new'
    else
      render 'new'
    end
  end

  def index
    @collations = Collation.all.page(params[:page]).per(20)
    if params[:select_csv]
      @date_extract = if params[:data]
        Time.zone.local(params[:data]['created_at(1i)'].to_i, params[:data]['created_at(2i)'].to_i, params[:data]['created_at(3i)'].to_i).to_date
      else
        Date.today
      end
      @date_today = Date.today
      @date_ago = @date_today - @date_extract
      @collations = Collation.where(created_at: @date_ago.day.ago.all_day)
    elsif params[:all_csv]
      @collationa = Collation.all
    end

    if params[:select_date]
      @date_extract = if params[:data]
                        Time.zone.local(params[:data]['created_at(1i)'].to_i, params[:data]['created_at(2i)'].to_i, params[:data]['created_at(3i)'].to_i).to_date
                      else
                        Date.today
                      end
      @date_today = Date.today
      @date_ago = @date_today - @date_extract
      @collations = Collation.where(created_at: @date_ago.day.ago.all_day).page(params[:page]).per(20)
    elsif params[:all_date]
      @collations = Collation.all.page(params[:page]).per(20)
    end

    respond_to do |format|
      format.html do
      end
      format.csv do
      end
    end
  end

  def delete
  end

  private
  def collation_params
    params.require(:collation).permit(:number1,:number2,:succes)
  end
end
