# frozen_string_literal: true
require 'bunny'

module Types
  class MutationType < Types::BaseObject
    field :create_policy, String, null: false do
      argument :emission_date, String
      argument :end_date_coverage, String
      argument :vehicle, ::Mutations::Inputs::VehicleInput
      argument :insured, ::Mutations::Inputs::InsuredInput
    end

    def create_policy(input)
      connection = Bunny.new(host: 'rabbitmq', port: '5672')
      connection.start

      channel = connection.create_channel
      queue = channel.queue('create_policy', durable: true)

      queue.publish(input.to_json)

      connection.close

      { response: 'OK' }.to_json
    end
  end
end
