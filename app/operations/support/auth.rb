module Support
  module Auth
    def require_auth
      self.class.require_auth ||= false
    end

    def authenticate!
      if require_auth && user == nil
        raise Unauthorized
      end
    end
  end
end
