require_relative "./card_order"
root_directory = File.expand_path("../", File.dirname(__FILE__))
Dir[root_directory + "/lib/**/*.rb"].each { |f| require f }
