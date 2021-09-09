# frozen_string_literal: true

module Items
  module Transactions
    class List
      include App::Transaction

      def initialize(deps = {})
        @items = DB[:items]
      end

      def call
        items = {
          items:
            @items.all
        }

        Success(items)
      end
    end
  end
end
