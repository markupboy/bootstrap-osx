require 'rake'
require 'open3'

apps_file = "./recipes/apps"
brew_file = "./recipes/brew"
libs_file = "./recipes/shared_libs"

task :install_homebrew do
  puts "\nrun the following command:\n\n\tsudo ruby -e \"$(curl -fsSkL raw.github.com/mxcl/homebrew/go)\"\n\n"
end

task :check_brew_status do
  if `which brew` == ""
    puts "\nInstall homebrew first by running the following command:\n\n\tsudo ruby -e \"$(curl -fsSkL raw.github.com/mxcl/homebrew/go)\"\n\n"
    fail
  end
end

task :brew => [:check_brew_status] do
  File.open("#{brew_file}", "r") do |file|
    file.each do |formula|
      puts %x[brew install #{formula.strip}]
    end
  end
end

task :install_gcc => [:check_brew_status] do
  puts %[brew tap homebrew/dupes]
  puts %[brew install apple-gcc42]
end

task :setup_mysql => [:check_brew_status] do
  puts %x[ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents]
  puts %x[launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist]
end

task :setup_postgres => [:check_brew_status] do
  puts %x[initdb /usr/local/var/postgres -E utf8]
  puts %x[ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents]
  puts %x[launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist]
end

task :setup_redis => [:check_brew_status] do
  puts %x[ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents]
  puts %x[launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist]
end

task :install_rubies => [:check_brew_status] do
  puts %x[CONFIGURE_OPTS=--without-tk rbenv install 1.8.7-p370]
  puts %x[rbenv install ree-1.8.7-2012.02 1.9.3-p327 1.9.3-p374 2.0.0-p195]
  puts %x[rbenv global 1.9.3-p374]
end

task :oh_my_zsh do
  puts %x[ln -s "$HOME/Dropbox/Shared\ Libraries/oh-my-zsh"]
end

task :dotfiles do
  puts %[cd "$HOME/Dropbox/Shared\ Libraries/dotfiles" && rake install && cd -]
end

task :link_libs do
  File.open("#{libs_file}", "r") do |file|
    file.each do |library|
      puts %x[ln -s "~/Dropbox/Shared Libraries/#{library}"]
    end
  end
end

task :download_apps do
  File.open("#{apps_file}", "r") do |file|
    file.each do |app_link|
      `open "#{app_link.strip}"`
    end
  end
end

task :set_dock_delay do
  puts %x[defaults write com.apple.Dock autohide-delay -float 0 && killall Dock]
end

task :default => [:install_homebrew]
task :dbs => [:setup_mysql, :setup_postgres, :setup_redis]
task :rubies => [:install_gcc, :install_rubies]
task :dev_environment => [:brew, :dbs, :rubies]

task :shell => [:oh_my_zsh, :dotfiles]

task :the_works => [:dbs, :rubies, :dev_environment, :shell, :link_libs, :download_apps, :set_dock_delay]
