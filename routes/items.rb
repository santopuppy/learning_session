# frozen_string_literal: true

class LearningSession
  hash_routes.on 'items' do |r|
    list_items = Items::Transactions::List.new

    r.get do
      result = list_items.call
      
      case result
      in Success(value)
        value.to_hash
      else
        response.status = :not_found
        { error: 'not found' }
      end
    end
  end
end
