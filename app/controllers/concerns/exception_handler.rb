module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError, with: :render_server
    rescue_from ActiveRecord::RecordNotFound, with: :render_record
    rescue_from ActionController::ParameterMissing, with: :render_request
  end

  private

  def render_request(exception = nil, messages = nil)
    render_error(400, 'Bad Request', exception&.message, *messages)
  end

  def render_record(exception = nil, _messages = nil)
    render_error(404, 'Record Not Found', exception&.message)
  end

  def render_server(exception = nil, _messages = nil)
    render_error(500, 'Internal Server Error', exception&.message)
  end

  def render_error(code, message, *error_messages)
    response = {
      message: message,
      errors: error_messages.compact
    }

    render json: response, status: code
  end
end
