# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    user nil
    uid "MyString"
    username "MyString"
    oauth_token "MyString"
    oauth_secret "MyString"
    oauth_expires "2013-07-10 15:06:51"
  end
end
