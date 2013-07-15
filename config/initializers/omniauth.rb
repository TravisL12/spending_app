Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, '2VOxxGHmC25GwLH4KsVeA', 'PrFQZd3gROKUju82Eb5ag4wKB8FH1akJCWleMIvJg'
  provider :facebook, '612429322114984', 'ec59f1386259333e153fb0b34c3f9c82',
  :scope => 'email,user_birthday,read_stream', :display => 'popup'
end
