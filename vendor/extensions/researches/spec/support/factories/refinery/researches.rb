
FactoryGirl.define do
  factory :research, :class => Refinery::Researches::Research do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

