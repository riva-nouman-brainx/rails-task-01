class CandidatesController < ApplicationController
  def index
    @position = Position.find(params[:position_id])
    @candidates = Candidate.where(position_id: params[:position_id])
  end

  def new
    @position = Position.find(params[:position_id])
    @candidate = @position.candidates.build
  end

  def create
    @position = Position.find(params[:position_id])
    @candidate = @position.candidates.build(candidate_params)
    if @candidate.save
      redirect_to position_candidates_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @position = Position.find(params[:position_id])
    @candidate = Candidate.find(params[:position_id])
  end

  def update
    @position = Position.find(params[:position_id])
    @candidate = Candidate.find(params[:position_id])

    if @candidate.update(candidate_params)
      redirect_to position_candidates_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @position = Position.find(params[:id])
    @candidate = Candidate.find(params[:position_id])
    @candidate.destroy

    redirect_to position_candidates_path, status: :see_other
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :dob, :email, :industry_experience)
  end
end
