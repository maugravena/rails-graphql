# frozen_string_literal: true

module Queries
  module BaseQuery
    extend ActiveSupport::Concern

    included do
      private

      def condition(query, condition, argument)
        return query unless argument
        query.where(condition, argument)
      end
    end
  end
end
