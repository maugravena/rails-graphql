module Mutations
  class CreatePolicy < BaseMutation
    # argument :policy, ::Mutations::Inputs::PolicyInput, required: true
    argument :emission_date, String
    argument :end_date_coverage, String
    argument :vehicle, String
    argument :insured, String

    field :response, String, null: false

    def resolve
      { response: 'OK' }
    end
  end
end
