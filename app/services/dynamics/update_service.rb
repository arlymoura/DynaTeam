# app/services/dynamics/update.rb
module Dynamics
  class UpdateService < BaseService
    def initialize(params)
      @params = params
    end

    def call
      return failure('Dinamica não econtrada') unless dynamic

      dynamic.update(parsed_params) ? success(dynamic) : failure(dynamic.errors.full_messages)
    end

    attr_reader :id, :params, :dynamic

    private

    def dynamic
      @dynamic ||= Dynamic.find_by(id: @params[:id])
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
          id: review[:id],
          rating: review[:rating],
          comment: review[:comment]
        }
      end.compact
    end
  end
end
