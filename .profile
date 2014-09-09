
export GRAILS_HOME=$HOME/.local/opt/grails-2.2.0

export PATH=$HOME/.homebrew/sbin:$PATH
export PATH=$HOME/.homebrew/bin:$PATH
export PATH=$HOME/.homebrew/opt/ruby/bin:$PATH
export PATH=$HOME/.local/opt:$PATH
export PATH=$GRAILS_HOME/bin:$PATH

export MANPATH=$HOME/.homebrew/share/man:$MANPATH

# Configure/run node version manager
source $(brew --prefix nvm)/nvm.sh

# Configure `chruby` so that `chruby` Terminal commands work
source $(brew --prefix chruby)/share/chruby/chruby.sh
# Change the default version of ruby
# Can also be done by enabling auto-switching in `chruby`, and
# using a `.ruby-version` file.
chruby 2.1.2


# Aliases #########

# Open this profile file with Sublime Text
#alias openprofile='open ~/.profile'
alias open-profile='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ~/.profile'

# Show hidden files in finder
# usage: % show-hidden {true,false}
showHidden() {
   defaults write com.apple.finder AppleShowAllFiles $1
   killall Finder
}
alias show-hidden=showHidden

# Print your $PATH or $MANPATH in human legible format
alias print-path="echo $PATH | tr ':' '\n'"
alias print-manpath="echo $MANPATH | tr ':' '\n'"

# Adds spaces to Dock
# usage % add-space {n}
addSpace() {
   for ((i=0; i<$1; i++)); do
       defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
   done

   killall Dock # Restart Dock
}
alias add-space=addSpace


# Git Aliases #########

# Add a remote from git
# usage: $ add-remote {name} {repo uri}
addRemote() {
  git remote add $1 $2
}
alias add-remote=addRemote

# Remove a remote from git
# usage: $ remove-remote {name}
removeRemote() {
   git remote rm $1
}
alias remove-remote=removeRemote


# ImageMagick Aliases #########

doSports() {
   time for i in *.png; do
      echo "$i : Compositing away team ..."
      convert -define png:color-type='6' "../bg/VS_Baseball.png" "$i" -gravity north -geometry +0+100 -composite "../bar/$i"
      echo "$i : Compositing home team ..."
      convert -define png:color-type='6' "../bar/$i" "../hometeam/home.png" -gravity south -geometry +0+100 -composite "../barbar/$i"
   done;
}
alias do-sports=doSports


# Compass Aliases #########

alias compass-prod="compass compile --output-style compressed --force"
