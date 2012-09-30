puts "Configuring mysql..."
`mkdir -p ~/Library/LaunchAgents`
`cp /usr/local/Cellar/mysql/5.5.27/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/`
`launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist`