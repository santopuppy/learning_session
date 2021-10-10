# frozen_string_literal: true

class LearningSession
  hash_routes.on 'items' do |r|
    list_items = Items::Transactions::List.new
    insert_items = Items::Transactions::Insert.new

    # Handle pre-flight OPTIONS request
    r.options do
      byebug
    end

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

    r.post do
      result = insert_items.call(r.params)

      case result
      in Success(value)
        { status: value }
      in Failure(error)
        response.status = :unprocessable_entity
        { error: error }
      else
        response.status = :unprocessable_entity
        { error: 'watdakwan' }
      end
    end
  end
end
