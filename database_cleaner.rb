require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
Spinach.hooks.before_scenario { DatabaseCleaner.clean }