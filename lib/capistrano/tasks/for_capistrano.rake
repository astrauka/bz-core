# Invoke any rake task via capistrano
# Examples:
#   cap staging cap_rake:invoke task="school:regenerate_letters school_id=1"
namespace :cap_rake do
  desc "Invoke rake task"
  task :invoke, roles: :backend do
    run "cd #{current_path} && bundle exec rake #{ENV['task']} RAILS_ENV=#{rails_env}"
  end
end
