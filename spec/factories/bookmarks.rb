FactoryGirl.define do
  factory :bookmark do
    url "http://www.google.com"
    association :user
  end

end
