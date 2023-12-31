class PositionsController < ApplicationController
  def index
    @positions = Position.all
  end

  def show
    @position = Position.find(params[:id])
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)

    if @position.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @position = Position.find(params[:id])
  end

  def update
    @position = Position.find(params[:id])

    if @position.update(position_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @position = Position.find(params[:id])

    # Delete associated candidates
    @position.candidates.each do |candidate|
      candidate.destroy
    end

    # Now, delete the position
    @position.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def position_params
    params.require(:position).permit(:title, :experience, :employment_type)
  end
end
