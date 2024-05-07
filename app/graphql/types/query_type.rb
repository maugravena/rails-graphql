# frozen_string_literal: true
require 'net/http'
require 'uri'

module Types
  class QueryType < GraphQL::Schema::Object
    field :policy, Types::PolicyType, null: false, description: 'show policy' do
      argument :policy_id, String, required: false, description: 'Policy identifier'
    end

    field :policies, [Types::PolicyType], null: false

    def policy(policy_id)
      fetch_policy("http://insurance_api:3333/policies/#{policy_id[:policy_id]}")
    end

    def policies
      fetch_policy("http://insurance_api:3333/policies")
    end

    def fetch_policy(url)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)

      request = Net::HTTP::Get.new(uri.request_uri)
      request['Authorization'] = "Bearer #{context[:token]}"

      response = http.request(request)

      JSON.parse(response.body) if response.is_a?(Net::HTTPSuccess)
    end
  end
end
