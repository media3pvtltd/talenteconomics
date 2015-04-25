class Section < ActiveRecord::Base
  attr_accessible :heading, :high_term, :instruction, :low_term, :rank, :summary_heading
end
