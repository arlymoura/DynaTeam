module Dynamics
  class CreateService < BaseService
    def initialize(params)
      @params = params
    end

    def call
      return failure(dynamic.errors.full_messages) unless dynamic.save

      success(dynamic)
    rescue StandardError => e
      failure(e.message)
    end

    attr_reader :params, :dynamic

    private

    def dynamic
      @dynamic ||= Dynamic.new(parsed_params)
    end

    def parsed_params
      {
        name: params[:name],
        description: params[:description],
        reviews_attributes: parsed_review_params
    }.compact
    end

    def parsed_review_params
      return unless params[:reviews_attributes].present?

      params[:reviews_attributes].map do |review|
        {
          rating: review[:rating],
          comment: review[:comment]
        }
      end.compact
    end
  end
end
