puts "Configuring postgresql..."
`initdb /usr/local/var/postgres -E utf8`
`mkdir -p ~/Library/LaunchAgents`
`cp /usr/local/Cellar/postgresql/9.2.1/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/`
`launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist`
