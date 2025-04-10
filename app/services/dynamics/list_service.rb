# app/services/dynamics/list.rb
module Dynamics
  class ListService < BaseService
    def call
      dynamics = Dynamic.includes(:reviews).all
      success(dynamics)
    end
  end
end
