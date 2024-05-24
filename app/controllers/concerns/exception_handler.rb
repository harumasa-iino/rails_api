module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError, with: :render_500
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
  end

  private

  def render_400(exception = nil, messages = nil)
    render_error(400, 'Bad Request', exception&.message, *messages)
  end

  def render_404(exception = nil, messages = nil)
    error_message = ["Couldn't find #{exception.model} with 'id'=#{exception.id}"] if exception.respond_to?(:model)
    render(json: { message: 'Record Not Found', exception: error_message }, status: 404)
  end

  def render_500(exception)
    error_message = 'Standard Error'
    render(json: { message: "Internal Server Error", exception: error_message }, status: 500)
  end

  def render_error(code, message, *error_messages)
    response = {
        message: message,
        errors: error_messages.compact
    }

    render json: response, status: code
  end
end