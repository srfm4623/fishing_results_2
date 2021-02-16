class ResultsController < ApplicationController

  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
    @results = Result.all.order("created_at DESC")
  end

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)
    if @result.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @result.comments
  end

  def edit
  end

  def update
    if @result.update(result_params)
      redirect_to result_path(@result)
    else
      render :edit
    end
  end

  def destroy
    @result.destroy
    redirect_to root_path
  end

  private
  def result_params
    params.require(:result).permit(:first_length, :second_length, :first_weight, :second_weight, :area, :means, :text,:image).merge(user_id: current_user.id)
  end

  def set_params
    @result = Result.find(params[:id])
  end
end


