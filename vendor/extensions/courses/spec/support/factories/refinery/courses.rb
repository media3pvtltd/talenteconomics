
FactoryGirl.define do
  factory :course, :class => Refinery::Courses::Course do
    sequence(:place) { |n| "refinery#{n}" }
  end
end

