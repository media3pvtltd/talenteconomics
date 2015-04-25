class EcprofilesController < ApplicationController
layout "home"
  def index
  	@profiles = Refprofile.order("name")
  end
  def show
  	@testimonials = Reftestimonial.find(:all, :select => 'name, content').as_json
  	@myvar = 1
  	@profile = Refprofile.find(params[:name].to_i)
  end
end
