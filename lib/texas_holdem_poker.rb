root_directory = File.expand_path("../", File.dirname(__FILE__))
Dir[root_directory + "/lib/**/*.rb"].each { |f| require f }
