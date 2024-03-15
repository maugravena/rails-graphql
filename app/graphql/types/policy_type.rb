module Types
  class PolicyType < GraphQL::Schema::Object
    field :policy_id, ID, null: false
    field :emission_date, String, null: false
    field :end_date_coverage, String, null: false
    field :insured, InsuredType, null: false
    field :vehicle, VehicleType, null: false
  end
end
