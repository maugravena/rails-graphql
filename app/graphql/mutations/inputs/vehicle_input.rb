module Mutations
  module Inputs
    class VehicleInput < GraphQL::Schema::InputObject
      argument :brand, String
      argument :year, String
      argument :model, String
      argument :license_plate, String
    end
  end
end
