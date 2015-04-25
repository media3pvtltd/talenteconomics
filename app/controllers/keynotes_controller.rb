class KeynotesController < ApplicationController
layout "home"
  def index
  	@keynotes = Refkeynote.find(:all, :select => 'latitude, longitude').as_json
  	@past = Refkeynote.where("date<?", Time.now)
  	@future = Refkeynote.where("date>?", Time.now)
  	@gallery = Refgallery.all
  end
  def create

  end

end
