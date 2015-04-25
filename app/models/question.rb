class Question < ActiveRecord::Base
  attr_accessible :high_term, :low_term, :rank, :section_id, :text
end
