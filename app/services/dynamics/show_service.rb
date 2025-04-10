# app/services/dynamics/show.rb
module Dynamics
  class ShowService < BaseService
    def initialize(id:)
      @id = id
    end

    def call
      dynamic = Dynamic.find_by(id: @id)
      dynamic ? success(dynamic) : failure('Dinamica não econtrada')
    end
  end
end
