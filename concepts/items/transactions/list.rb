# frozen_string_literal: true

module Items
  module Transactions
    class List
      include App::Transaction

      def call
        {
          items: [
            {id: 1, content: 'buy grocery'},
            {id: 2, content: 'eat rice'}
          ]
        }
      end
    end
  end
end
