#
# Usage: 
# 
#   class MyFeature < Spinach::FeatureSteps
#     include Spinach::CurrentUser
#   end
#
module Spinach
  module CurrentUser
    include Spinach::DSL

    def current_user
      # Fabrication
      # @current_user ||= Fabricate(:user, password: 'test1234', password_confirmation: 'test1234')

      # Factory Girl
      # @current_user ||= FactoryGirl.create(:user, password: 'test1234', password_confirmation: 'test1234')
    end
    
    
    step 'I am logged in' do
      login_as current_user
      # Use this if you're using capybara-webkit and issues with login in
      # login_as(current_user, scope: :user, run_callbacks: false)
    end
  end
end
