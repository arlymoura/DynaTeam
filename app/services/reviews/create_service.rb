# app/services/reviews/create.rb
module Reviews
  class CreateService < BaseService
    def initialize(dynamic_id:, params: {})
      @dynamic_id = dynamic_id
      @params = params
    end

    def call
      return failure('Dinamica não econtrada') unless dynamic
      return failure(review.errors.full_messages) unless review.save

      success(review)
    end

    attr_reader :dynamic_id, :params, :review, :dynamic

    private

    def parsed_params
      {
        rating: params[:rating],
        comment: params[:comment]
      }
    end

    def review
      @review ||= dynamic.reviews.build(parsed_params)
    end

    def dynamic
      @dynamic ||= Dynamic.find_by(id: @dynamic_id)
    end
  end
end

