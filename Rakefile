require 'fileutils'

task :default => :install

manifest        = %w[vim vimrc]
vim_config_root = File.dirname __FILE__

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


scvim_dir = File.join vim_config_root, *%w{vim bundle scvim}

desc "Set up scvim bin/ symlinks"
task :symlink_scvim_bin do
  bin_dir       = File.join ENV['HOME'], "local", "bin"
  scvim_bin_dir = File.join scvim_dir, 'bin'

  if File.exist? bin_dir
    Dir.glob(File.join(scvim_bin_dir, '*')).each do |f|
      symlink_path = "#{bin_dir}/#{File.basename(f)}"
      print "Symlinking #{f}... "

      unless File.exist? symlink_path
        File.symlink f, symlink_path
        puts "done."
      else
        puts "already exists, skipped."
      end
    end
  else
    raise Exception, "#{bin_dir} does not exist. Create directory or edit location."
  end
end

desc "Symlink ~/.scvimrc"
task :symlink_scvimrc do
  unless File.exist? File.join(ENV['HOME'], '.scvimrc')
    File.symlink File.join(scvim_dir, 'scvimrc'), File.join(ENV['HOME'], '.scvimrc')
  end
end

desc "Source scvim class in ~/.sclang.cfg"
task :source_scvim do
  sclang_cfg      = File.join ENV['HOME'], '.sclang.cfg'
  scvim_class_dir = File.join scvim_dir, 'scclasses'

  f = File.open sclang_cfg, "r+"

  f.each_line {|ln|
    if ln =~ /\+#{Regexp.escape scvim_class_dir}/
      puts "scvim SuperCollider class already set to be sourced. Skipped."
      next
    end
  }

  f.write "+#{scvim_class_dir}\n"
  f.close
end

