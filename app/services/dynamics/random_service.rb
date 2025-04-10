# app/services/dynamics/random.rb
module Dynamics
  class RandomService < BaseService

    def call
      dynamic = Dynamic.order('RANDOM()').first
      dynamic ? success(dynamic) : failure('Nenhuma dinamica cadastrada')
    end
  end
end
