task default: :install

manifest        = %w[vim vimrc]
vim_config_root = File.dirname(__FILE__)

desc "Set up symlinks and init submodules"
task :install do
  manifest.each do |f|
    target, file = "#{Dir.getwd}/#{f}", "#{File.expand_path("~")}/.#{f}"

    puts "Linking #{file}"

    # Remove existing file or dir
    if File.exists?(file)
      if File.directory?(file)
        rm_rf(file)
      else
        rm(file)
      end
    end

    File.symlink(target, file)
  end
  Rake::Task[:init_submodules].invoke
end

desc "Pull submodules"
task :init_submodules do
  `git submodule init && git submodule update`
end
