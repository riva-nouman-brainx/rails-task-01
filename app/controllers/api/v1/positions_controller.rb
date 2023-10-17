module Api
  module V1
    class PositionsController < ActionController::Base
      skip_before_action :verify_authenticity_token

      def index
        @positions = Position.all

        render json: @positions, status: :ok
      end

      def create
        @position = Position.new(position_params)
        @position.save

        render json: @position, status: :created
      end

      def show
        @position = Position.find_by(id: params[:id])
        render json: @position, status: :found
      end

      def update
        @position = Position.find(params[:id])
        if @position.update(position_params)
          render json: @position, status: :ok
        else
          render json: { errors: @position.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @position = Position.find(params[:id])
        if @position.destroy
          render json: { message: "deletion successful" }, status: :ok
        end
      end

      private

      def position_params
        params.require(:position).permit(:title, :experience, :employment_type, :thumbnail)
      end
    end
  end
end
