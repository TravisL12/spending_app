# Load the rails application
require File.expand_path('../application', __FILE__)

app_env_vars = File.join(Rails.root, 'config', 'initializers', 'env_vars.rb')
load(app_env_vars) if File.exists?(app_env_vars)

# Initialize the rails application
SpreadsheetUsa::Application.initialize!
