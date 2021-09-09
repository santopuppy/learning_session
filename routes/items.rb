# frozen_string_literal: true

class LearningSession
  hash_routes.on 'items' do |r|
    r.get do
      {
        items: []
      }
    end
  end
end
