# frozen_string_literal: true

module Items
  module Transactions
    class Insert
      include App::Transaction

      def initialize(deps = {})
        @items = DB[:items]
      end

      def call(params)

        Success(:ok)
      end
    end
  end
end
