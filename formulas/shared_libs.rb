puts "Linking shared libraries..."

shared_libs_loc = "$HOME/Library/Application\\ Support"

libs = [
	"Adium\\ 2.0",
	"Alfred",
	"Propane",
	"Sublime\\ Text\\ 2",
	"TextExpander",
	"Transmit",
	"Yojimbo",
	"iTerm"
]

libs.each	do |lib|
	`ln -s #{shared_libs_loc}/#{lib} $HOME/Library/Application\\ Support`	
end