# frozen_string_literal: true

class LearningSession
  hash_routes.on 'items' do |r|
    list_items = Items::Transactions::List.new

    r.get do
      list_items.call
    end
  end
end
