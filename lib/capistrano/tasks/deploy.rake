namespace :deploy do
  desc "Restart application"
  task :restart do
    on roles(:app) do
      execute "start #{fetch(:application)} || restart #{fetch(:application)}"
    end
  end

  desc "Export upstart scripts via foreman"
  task :export_app do
    on roles(:app) do
      within release_path do
        execute :bundle, ["exec foreman export upstart /home/#{fetch(:user)}/.init",
                   "-a #{fetch(:application)}",
                   "-f Procfile.#{fetch(:stage)}",
                   "-u #{fetch(:user)}",
                   "-l #{shared_path}/log",
                   "-t config/deploy/templates"].join(" ")
      end
    end
  end

  task :start do
    on roles(:app) do
      execute "start #{fetch(:application)}"
    end
  end

  task :stop do
    on roles(:app) do
      execute "stop #{fetch(:application)}"
    end
  end

  after :publishing, "unicorn:server_config"
  after "unicorn:server_config", :export_app
  after :export_app, :restart
  after :finishing, "deploy:cleanup"
end
