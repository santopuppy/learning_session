require 'dry/monads'
require 'dry/monads/do'
require 'dry-struct'
require 'dry/validation'

module App
  module Transaction
    def self.included(base)
      base.include(Dry::Monads[:result])
      base.include(Dry::Monads::Do.for(:call))
    end
  end

  module Operation
    def self.included(base)
      base.include(Dry::Monads[:result])
    end
  end

  module Types
    include Dry.Types()
  end

  class Struct < Dry::Struct
  end

  class Contract < Dry::Validation::Contract
  end

  class ApplyContract
    include Operation

    def initialize(contract)
      @contract = contract
    end

    def call(params)
      result = @contract.call(params)

      if result.success?
        Success(result.to_h)
      else
        Failure(result.errors.to_h)
      end
    end
  end
end
