module Appdrones
  class AppdronesRailtie < ::Rails::Railtie

    rake_tasks do
        load "tasks/appdrones_tasks.rake"
    end
  end
end
