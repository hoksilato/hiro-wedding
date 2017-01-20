class Operation
  include Support::Validate

  attr_accessor :params, :headers, :request_obj

  def initialize(params, request)
    @params = params
    @request_obj = request
    @headers = request.headers
  end

  def execute
    begin
      process
    rescue ActiveRecord::RecordNotFound => _
      raise NotFound
    end
  end

  private

  def process
    raise NotImplementedError
  end
end
