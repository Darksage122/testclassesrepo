FactoryGirl.define do
  factory :dog do
    name "Fido"
    email "fluffster@aol.com"
    password "testtest"
    password_confirmation "testtest"
    birthday 3.years.ago
    city "New York"
    state "NY"
  end
end