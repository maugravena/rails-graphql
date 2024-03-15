module Types
  class VehicleType < GraphQL::Schema::Object
    field :brand, String, null: false
    field :model, String, null: false
    field :license_plate, String, null: false
    field :year, String, null: false
  end
end
