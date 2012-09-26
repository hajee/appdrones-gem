require 'cucumber/rake/task'

namespace :appdrones do

  desc "Execute the nesceccery actions before dploying to cloudfoundry"
  task :pre_deploy do
    Rake::Task["assets:compile"].invoke
  end


  desc "Execute a full Cucumber test and reporting progress to cucumber"

  Cucumber::Rake::Task.new({:report_progress => 'db:test:prepare'}, 'Run features that should pass') do |t|
    t.binary = vendored_cucumber_bin # If nil, the gem's binary is used.
    t.cucumber_opts = ['--format','appdrones_progress']
    t.fork = true # You may get faster startup if you set this to false
  end


end
