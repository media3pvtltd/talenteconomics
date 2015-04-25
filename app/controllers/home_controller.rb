class HomeController < ApplicationController
  def index
  	@home_page = Refinery::Page.where(:slug => 'home_about_website').first
  	@social = Refinery::Page.where(:slug => 'home_social_groups').first
  	@banner = Refbanner.find(:all, :select => 'photo_id, category').as_json.select {|e| e["category"] == 1}
    @testimonials = Reftestimonial.find(:all, :select => 'name, content').as_json
  	@myvar = 1
  end
  def logout
  	redirect_to root_url
  end
end
