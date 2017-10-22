require 'mail'

module Schedroom
  module Validator
    class Email
      def validate(value)
        data = Mail::Address.new(value)
        return true
      rescue Mail::Field::ParseError
        return false
      end
    end
  end
end
