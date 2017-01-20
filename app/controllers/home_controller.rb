class HomeController < ApplicationController
  def index
    if params[:code].present?
      return redirect_to_show(Visitor.find_by_code(params[:code])) if Visitor.exists?(code: params[:code])
    end

    render_index
  end

  def create
    @rsvp = Rsvp.new(rsvp_params)
    # @rsvp = rsvp.find_by_code(rsvp_params[:code])

    if @rsvp.save
      return redirect_to root_path(code: @rsvp.code), flash: {success: 'RSVP successfully.'}
    end

    render :index
  end

  def show
    @visitor = Visitor.find_by_code(params[:code])
  end

  private
  def rsvp_params
    params.require(:rsvp).permit(:code, :num)
  end

  def render_index
    @rsvp = Rsvp.new
    return render :index
  end

  def redirect_to_show(visitor)
    redirect_to :action => 'show', :code => visitor.code
  end
end
