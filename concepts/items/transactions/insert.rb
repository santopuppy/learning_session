# frozen_string_literal: true

module Items
  module Transactions
    class Insert
      include App::Transaction

      def initialize(deps = {})
        @items = DB[:items]
        @apply_contract = deps[:apply_contract] || App::ApplyContract.new(Items::Contracts::Insert.new)
      end

      def call(params)
        clean_params = yield @apply_contract.call(params)
        @items.insert(params)
        Success(:ok)
      end
    end
  end
end
