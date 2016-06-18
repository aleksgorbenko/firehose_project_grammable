FactoryGirl.define do
  factory :comment do

  end
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@mgmail.com"
    end
    password "secretPassword"
    password_confirmation "secretPassword"

  end

  factory :gram do
    message "hello"
    picture { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'sample.png'), 'image/png') }

    association :user
  end

  # factory :comment do
  #   message "comment"

  #   association :user
  #   association :gram
  # end
end