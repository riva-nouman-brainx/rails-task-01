class AssessmentsController < ApplicationController
  def index
    @assessments = Assessment.all
  end

  private

  def assessment_params
    params.require(:assessment).permit(:title, :tests)
  end
end
