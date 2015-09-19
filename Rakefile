require "bundler/gem_tasks"

task :default => :test

task :test do
  # Dir.glob("test/test*").map {|f| require f}
  Dir.glob("test/test*").map {|f| require_relative f}
end
