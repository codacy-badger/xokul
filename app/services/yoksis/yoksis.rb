# frozen_string_literal: true

require_relative 'lib/version'

module Services
  class Yoksis
    require_relative "lib/#{VERSION}/base"
    require_relative "lib/#{VERSION}/constants"
    require_relative "lib/#{VERSION}/graduates"
    require_relative "lib/#{VERSION}/meb"
    require_relative "lib/#{VERSION}/references"
    require_relative "lib/#{VERSION}/registrations"
    require_relative "lib/#{VERSION}/resumes"
    require_relative "lib/#{VERSION}/staff"
    require_relative "lib/#{VERSION}/students"
    require_relative "lib/#{VERSION}/units"

    def self.module_path
      "#{inspect}::#{VERSION.upcase}".constantize
    end
  end
end
