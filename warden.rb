warden.rb

Spinach::FeatureSteps.include Warden::Test::Helpers

Spinach.hooks.after_scenario do 
  Warden.test_reset!
end