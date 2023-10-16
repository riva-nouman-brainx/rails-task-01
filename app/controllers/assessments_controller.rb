class AssessmentsController < ApplicationController
  def index
    @assessments = Assessment.all
  end

  def new
    @assessment = Assessment.new
  end

  def create
    @assessment = Assessment.new(assessment_params)

    if @assessment.save
      redirect_to assessments_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @assessment = Assessment.find(params[:id])
  end

  def update
    @assessment = Assessment.find(params[:id])

    if @assessment.update(assessment_params)
      redirect_to assessments_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @assessment = Assessment.find(params[:id])
    @assessment.destroy

    redirect_to assessments_path, status: :see_other
  end

  private

  def assessment_params
    params.require(:assessment).permit(:title, :test)
  end
end
