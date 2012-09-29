#config

ohmyzsh_location = "$HOME/Dropbox/Shared\\ Libraries/oh-my-zsh"
dotfiles_location = "$HOME/Dropbox/Shared\\ Libraries/dotfiles"

brew_file = "./recipes/brew"
apps_file = "./recipes/apps"
download_location ="$HOME/downloads"

#homebrew
unless brew_file == ""
	if `which brew` == ""
	  puts "Installing Homebrew..."
	  `ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"`
	end
	File.open("#{brew_file}", "r") do |file_handle|
	  file_handle.each do |formula|
	    puts "Installing #{formula}"
	    `brew install #{formula}`
	  end
	end	
	puts " _______________________________________________________"
	puts "|                                                       |"
	puts "| Databases have been left out, please install manually |"
	puts "|                                                       |"
	puts " ------------------------------------------------------- "
end	

#oh-my-zsh
unless ohmyzsh_location == ""
	puts "Linking oh-my-zsh..."
	`ln -s #{ohmyzsh_location} $HOME/.oh-my-zsh`
end

#formulas
formulas = Dir.glob('./formulas/**{.rb}')
formulas.each do |formula|
	`ruby #{formula}`
end

#dotfiles
puts "Linking dotfiles"
`cd #{dotfiles_location} && rake install && cd -`

#apps
File.open("#{apps_files}", "r") do |file_handle|
	file_handle.each do |recipe|
		app = recipe.split()[0]
		file = recipe.split()[1]
		puts "Downloading #{app}..."
		`cd #{download_location} && curl -O #{file}`
	end
end