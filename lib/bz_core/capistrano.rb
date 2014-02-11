%w(unicorn deploy).each do |file|
  load File.expand_path("../../capistrano/tasks/#{file}.rake", __FILE__)
end
