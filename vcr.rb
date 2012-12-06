require 'vcr'

if defined?(VCR)
  VCR.configure do |c|
    c.default_cassette_options = {record: :new_episodes}
    c.cassette_library_dir = 'fixtures/vcr_cassettes'
    c.hook_into :webmock
    c.ignore_localhost = true
  end
end

Spinach.hooks.before_scenario do |scenario|
  VCR.insert_cassette(scenario.name.parameterize)
end

Spinach.hooks.after_scenario do
  VCR.eject_cassette
end%             