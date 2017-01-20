class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  def execute
    begin
      render_response(create_operation.execute)
    rescue BaseError => error
      render_response(error)
    end
  end

  private
  def create_operation
    find_operation.new(params, request)
  end

  def find_operation
    "#{find_module}::#{find_action}".constantize
  end

  def find_module
    controller_name.camelize
  end

  def find_action
    action_name.camelize
  end

  def render_response(data)
    respond_to do |format|
      format.json { render_json data }
      format.html { @result = data }
      format.js { @result = data }
    end
  end

  def render_json(data)
    if data.kind_of?(BaseError)
      render json: data.to_json, status: data.status
    else
      if (header = data.try(:header))
        response.headers.merge!(header)
        render json: data.body.to_json
      else
        render json: data.to_json
      end
    end
  end
end
