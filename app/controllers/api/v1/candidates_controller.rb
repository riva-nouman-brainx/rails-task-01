module Api
  module V1
    class CandidatesController < ActionController::Base
      skip_before_action :verify_authenticity_token

      def index
        @position = Position.find(params[:position_id])
        @candidates = @position.candidates

        render json: @candidates, status: :ok
      end

      def create
        @position = Position.find(params[:position_id])
        @candidate = @position.candidates.new(candidate_params)
        @candidate.save

        render json: @candidate, status: :created
      end

      def show
        @position = Position.find(params[:position_id])
        @candidate = @position.candidates.where(id: params[:id])

        render json: @candidate, staus: :found
      end

      def update
        @position = Position.find(params[:position_id])
        @candidate = @position.candidates.find(params[:id])
        if @candidate.update(candidate_params)
          render json: @candidate, status: :ok
        else
          render json: { errors: @candidate.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @position = Position.find(params[:position_id])
        @candidate = @position.candidates.find(params[:id])
        if @candidate.destroy!
          render json: { message: "deletion successful" }, status: :ok
        end
      end

      private

      def candidate_params
        params.require(:candidate).permit(:name, :dob, :email, :industry_experience)
      end
    end
  end
end
