class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_params
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_record

  private

  def invalid_params(exception)
    render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

  def invalid_record(exception)
    render json: { error: "#{exception.model} not found"}, status: :unauthorized
  end

end
