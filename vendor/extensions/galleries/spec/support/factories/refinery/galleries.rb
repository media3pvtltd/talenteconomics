
FactoryGirl.define do
  factory :gallery, :class => Refinery::Galleries::Gallery do
    sequence(:caption) { |n| "refinery#{n}" }
  end
end

