
FactoryGirl.define do
  factory :bte_gallery, :class => Refinery::BteGalleries::BteGallery do
    sequence(:caption) { |n| "refinery#{n}" }
  end
end

