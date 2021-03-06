# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class Staff < Base
        WSDL_URL = 'http://servisler.yok.gov.tr/ws/UniversiteAkademikPersonelv1?WSDL'

        def academicians_by_id_number(querier, queried)
          client.request(
            operation: STAFF_METHODS[__method__],
            result_path: STAFF_RESULT_PATHS[__method__],
            SORGULAYAN_TC_KIMLIK_NO: querier,
            AKPER_TC_KIMLIK_NO: queried
          )
        end

        def academicians_by_page(querier, page = 1)
          client.request(
            operation: STAFF_METHODS[__method__],
            result_path: STAFF_RESULT_PATHS[__method__],
            SAYFA: page,
            SORGULAYAN_TC_KIMLIK_NO: querier
          )
        end

        def nationalities
          client.request(
            operation: STAFF_METHODS[__method__],
            result_path: STAFF_RESULT_PATHS[__method__]
          )
        end

        def pages(querier)
          client.request(
            operation: STAFF_METHODS[__method__],
            result_path: STAFF_RESULT_PATHS[__method__],
            SORGULAYAN_TC_KIMLIK_NO: querier
          )
        end

        protected

        attr_reader :client
      end
    end
  end
end
