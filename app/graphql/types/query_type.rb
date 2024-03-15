# frozen_string_literal: true
require 'net/http'
require 'uri'

module Types
  class QueryType < GraphQL::Schema::Object
    field :policy, Types::PolicyType, null: false, description: 'show policy' do
      argument :policy_id, String, required: false, description: 'teste'
    end

    def policy(policy_id)
      url = URI.parse("http://192.168.208.4:3000/policies/#{policy_id[:policy_id]}")
      http = Net::HTTP.new(url.host, url.port)

      resquest = Net::HTTP::Get.new(url.request_uri)
      response = http.request(resquest)

      JSON.parse(response.body)
    end
  end
end
