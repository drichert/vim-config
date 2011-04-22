require 'fileutils'

task :default => :install

manifest = %w[vim vimrc] 

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

    Rake::Task[:init_submodules].invoke
  end  
end

desc "Pull submodules"
task :init_submodules do
  `git submodule init && git submodule update`  
end
