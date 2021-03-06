# frozen_string_literal: true

module Yoksis
  class GraduatesController < ApplicationController
    before_action :set_graduations

    include ActionsResource
    include YoksisResource

    def students
      render(
        serializer: action_serializer,
        json: @graduations.students(secure_params.require(:id_number))
      )
    end

    private

    def set_graduations
      @graduations = Services::Yoksis.module_path::Graduates.new(
        Rails.application.credentials.yoksis[:client_id],
        Rails.application.credentials.yoksis[:client_secret]
      )
    end

    def secure_params
      params.require(:graduate).permit(:id_number)
    end
  end
end
