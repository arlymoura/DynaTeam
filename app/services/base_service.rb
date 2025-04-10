# app/services/base_service.rb
class BaseService
  attr_reader :data

  def self.call(*args, **kwargs)
    new(*args, **kwargs).call
  end

  def success(data = {})
    Result.new(true, data)
  end

  def failure(data = {})
    Result.new(false, data)
  end

  # Classe interna para encapsular o resultado
  class Result
    attr_reader :data

    def initialize(success, data = {})
      @success = success
      @data = data
    end

    def success?
      @success
    end

    def failure?
      !@success
    end
  end
end
