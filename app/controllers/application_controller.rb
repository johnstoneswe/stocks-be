class ApplicationController < ActionController::API
    include ActionController::Cookies
    before_action :find_user

    rescue_from ActiveRecord::RecordNotFound with record_not_found
    rescue_from ActiveRecord::RecordInvalid  with invalid_record

    def index
        render json: { message: "favorite stocks watcher" }
    end

    private

    def find_user
      @user = User.find_by(id: params[:id])

      if @user
        render json: @user, status: :ok
      else
        render json: { error: "Unauthorized"}, status: :unauthorized
      end
    end

    def record_not_found
        render json: { error: "Record Not found"}, status: :not_found
    end

    def invalid_record record
      render json: { errors: record.error.full_messages }
    end
end
