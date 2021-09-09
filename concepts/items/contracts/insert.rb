module Items
  module Contracts
    class Insert < App::Contract
      params do
        required(:content).filled(:string)
      end
    end
  end
end

