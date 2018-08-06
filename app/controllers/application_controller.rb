# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActionController::BadRequest,             with: :bad_request
  rescue_from ActionController::ParameterMissing,       with: :bad_request
  rescue_from ActionController::RoutingError,           with: :not_found
  rescue_from Services::Support::HTTPError,             with: :services_error
  rescue_from Services::Support::SOAPError,             with: :services_error
  rescue_from Services::Support::UnknownOperationError, with: :services_error
  rescue_from Services::Support::TCPError,              with: :services_error

  def bad_request(exception)
    render json:   { identifier: 'api_bad_request', message: exception },
           status: :bad_request
  end

  def not_found(exception)
    render json:   { identifier: 'api_not_found', message: exception },
           status: :not_found
  end

  def services_error(exception)
    render json:   { identifier: exception.identifier, message: exception },
           status: exception.code
  end
end
