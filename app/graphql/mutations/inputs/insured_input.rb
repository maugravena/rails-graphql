module Mutations
  module Inputs
    class InsuredInput < GraphQL::Schema::InputObject
      argument :name, String
      argument :cpf, String
    end
  end
end
