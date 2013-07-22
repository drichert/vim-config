include FileUtils::Verbose

root = File.dirname(__FILE__)

task(default: :install)

desc "Install Vim config"
task(install: [:create_symlinks, :init_submodules, :update_submodules])

desc "Create symlinks for vim/ and vimrc"
task :create_symlinks do
  home = ENV["HOME"]

  %w{vim vimrc}.each do |f|
    rm_rf("#{home}/.#{f}")
    ln_s("#{root}/#{f}", "#{home}/.#{f}")
  end
end

desc "Update all submodules"
task :update_submodules do
  system("git submodule foreach 'git checkout -q master && git pull'")
end

desc "Init  submodules"
task :init_submodules do
  system("git submodule init")
end
