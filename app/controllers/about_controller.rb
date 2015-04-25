class AboutController < ApplicationController
layout "home"
  def index
  	@aboutme = Refinery::Page.where(:slug => 'about_author').first
  	@social = Refinery::Page.where(:slug => 'about_author_social_groups').first
  	@banner = Refbanner.find(:all, :select => 'photo_id, category').as_json.select {|e| e["category"] == 2}
  end
end
