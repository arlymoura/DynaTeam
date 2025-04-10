# app/services/dynamics/destroy.rb
module Dynamics
  class DestroyService < BaseService
    def initialize(id:)
      @id = id
    end

    def call
      return failure('Dinamica não econtrada') unless dynamic

      dynamic.destroy
      success(dynamic)
    end

    attr_reader :id

    private

    def dynamic
      @dynamic ||= Dynamic.find_by(id: @id)
    end
  end
end
