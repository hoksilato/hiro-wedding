class Operation
  include Support::Auth
  include Support::Policy
  include Support::Validate

  attr_accessor :user, :params, :headers, :request_obj

  def initialize(params, request, user = nil)
    @params = params
    @request_obj = request
    @headers = request.headers
    @user = user
  end

  def execute
    begin
      authenticate!
      authorize_action!
      process
    rescue ActiveRecord::RecordNotFound => _
      raise NotFound
    end
  end

  private
  class << self
    attr_accessor :require_auth, :require_authorize

    def require_auth!
      self.require_auth = true
    end

    def require_authorize!
      self.require_authorize = true
    end
  end

  def process
    raise NotImplementedError
  end
end
