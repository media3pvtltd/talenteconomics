
FactoryGirl.define do
  factory :keynote, :class => Refinery::Keynotes::Keynote do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

