# frozen_string_literal: true

module Yoksis
  class ReferencesController < ApplicationController
    before_action :set_references

    # In flux
    Services::Yoksis.module::REFERENCES_METHODS.each_key do |method|
      define_method(method) do
        serializer = "Yoksis::References::#{method.to_s.camelize}Serializer"
        render(
          json: @references.send(method).purify,
          each_serializer: serializer.constantize
        )
      end
    end

    def district
      response = @references.district(params.require(:province_code))
      render(
        json: response.purify,
        each_serializer: Yoksis::References::DistrictSerializer
      )
    end

    private

    def set_references
      @references = Services::Yoksis.module::References.new
    end
  end
end
