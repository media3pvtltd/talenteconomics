class ConsultingController < ApplicationController
layout "home"
  def index
  	@consulting = Refinery::Page.where(:slug => "consulting_process").first
  	@case_study = Refinery::Page.where(:slug => "consulting_case_study").first
  end
end
