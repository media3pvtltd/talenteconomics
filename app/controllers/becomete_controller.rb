class BecometeController < ApplicationController
layout 'home'
  def index
  	@testimonials = Refbtest.find(:all, :select => 'name, content').as_json
  	@about_program = Refinery::Page.where(:slug => 'become_talent_economics_about_program').first
  	@myvar = 1
  	@gallery = Refbgallery.all
    @program_structure = Refinery::Page.where(:slug => 'become_talent_economics_program_structure').first 
  	@courses = Refcourse.all
  end
  def contact
    UserMailer.delay.contact_email(params)
    UserMailer.delay.support_email(params)
    redirect_to action: :index, alert: "Mail Sent Successfully"
  end
end

