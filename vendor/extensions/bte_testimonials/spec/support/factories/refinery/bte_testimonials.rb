
FactoryGirl.define do
  factory :bte_testimonial, :class => Refinery::BteTestimonials::BteTestimonial do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

