class WidgetController < ApplicationController
  def show
  end

  def dynamic_constant
    identifier_class = params[:IdentifierClass]
    namespace = identifier_class.constantize::IDENTIFIER_NAMESPACE # should warn
  end

  def render_thing
    render params[:x].thing?
  end

  def render_inline
    render :inline => "<%= xss.html_safe %>", :content_type => "text/html", :locals => { :xss => params[:xss] }
  end
end

IDENTIFIER_NAMESPACE = 'apis'
