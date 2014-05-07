namespace :deploy do
  desc "Restart application"
  task :restart do
    on roles(:app) do
      case fetch(:webserver)
      when "passenger"
        # make sure user can sudo restart
        execute "sudo /etc/init.d/nginx restart"
      when "unicorn", nil
        execute "start #{fetch(:application)} || restart #{fetch(:application)}"
      end
    end
  end

  desc "Export upstart scripts via foreman"
  task :export_app do
    on roles(:app) do
      case fetch(:webserver)
      when "passenger"
        # nothing, passenger manages itself
      when "unicorn", nil
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
  end

  task :start do
    on roles(:app) do
      case fetch(:webserver)
      when "passenger"
        # nothing, passenger manages itself
      when "unicorn", nil
        execute "start #{fetch(:application)}"
      end
    end
  end

  task :stop do
    on roles(:app) do
      case fetch(:webserver)
      when "passenger"
        # nothing, passenger manages itself
      when "unicorn", nil
        execute "stop #{fetch(:application)}"
      end
    end
  end

  desc 'Invoke a rake command on the remote server'
  task :invoke, [:command] => 'deploy:set_rails_env' do |task, args|
    on primary(:app) do
      within current_path do
        with rails_env: fetch(:rails_env) do
          rake args[:command]
        end
      end
    end
  end

  if ["unicorn", nil].include? fetch(:webserver)
    after :publishing, "unicorn:server_config"
    after "unicorn:server_config", :export_app
  end
  before :restart, "deploy:export_app"
  after :finishing, "deploy:cleanup"
end
