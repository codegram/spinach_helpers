#
# Usage: 
# 
#   class MyFeature < Spinach::FeatureSteps
#     include Spinach::MailHelpers
#   end
#
module Spinach
  module MailHelpers
    include Spinach::DSL

    # Returns the last sent mail.
    def last_mail
      # Uncomment if you use Sidekiq with ActionMailer
      # Sidekiq::Extensions::DelayedMailer.drain
      ActionMailer::Base.deliveries.first
    end

    # Returns an array with all the links in the email body.
    def links_in_email(email)
      URI.extract(email.to_s, ['http', 'https'])
    end

    # Visits a link in the provided email. Will visit the last mail if no regex given
    #
    # email - The email to search for links.
    # regex - An optional regex to match the link to
    #
    def click_link_in_email(email, regex = nil)
      links = links_in_email(email)
      link = if regex
               links.detect do |link|
                 regex.match(link)
               end
             else
               links.first
             end

      visit URI.parse(link).request_uri
    end
  end
end