
# export GRAILS_HOME=$HOME/.local/opt/grails-2.2.0
# export GRAILS_HOME=$HOME/.local/opt/grails-2.4.3

# export SLIMERJSLAUNCHER=/Applications/Firefox.app/Contents/MacOS/firefox

# Try to use local (project) module first
export PATH=./node_modules/.bin:$PATH

# This would allow for using a local module, regardless of where in the repo you `cd`
# export PATH=$(npm bin):$PATH coffee
# You could alias the above like
# alias npm-exec='PATH=$(npm bin):$PATH'
# ... then something like this would execute the local `coffee`
# npm-exec which coffee

# export PATH=$HOME/.homebrew/sbin:$PATH
# export PATH=$HOME/.homebrew/bin:$PATH
# export PATH=$HOME/.homebrew/opt/ruby/bin:$PATH
# export PATH=$HOME/.local/opt:$PATH
# export PATH=$GRAILS_HOME/bin:$PATH

# export MANPATH=$HOME/.homebrew/share/man:$MANPATH

# Configure/run node version manager
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Configure `chruby` so that `chruby` Terminal commands work
source $(brew --prefix chruby)/share/chruby/chruby.sh
# Change the default version of ruby
# Can also be done by enabling auto-switching in `chruby`, and
# using a `.ruby-version` file.
chruby 2.1.3


# Aliases #########

# Open this profile file with Sublime Text
#alias openprofile='open ~/.profile'
alias open-profile='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ~/.profile'

# Open hosts file with Sublime Text
#alias openprofile='open ~/.profile'
alias open-hosts='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /private/etc/hosts'

# Show hidden files in finder
# usage: $ show-hidden {true,false}
showHidden() {
   defaults write com.apple.finder AppleShowAllFiles $1
   killall Finder
}
alias show-hidden=showHidden

# Print your $PATH or $MANPATH in human legible format
alias print-path="echo $PATH | tr ':' '\n'"
alias print-manpath="echo $MANPATH | tr ':' '\n'"

# Adds spaces to Dock
# usage $ add-space {n}
addSpace() {
   for ((i=0; i<$1; i++)); do
       defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
   done

   killall Dock # Restart Dock
}
alias add-space=addSpace


# Git Aliases #########

# Add a remote from git
# usage: $ add-remote {user-name}
addRemote() {
  git remote add $1 https://github.webapps.rr.com/$1/${PWD##*/}.git
}
alias add-remote=addRemote

# Remove a remote from git
# usage: $ remove-remote {user-name}
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

doMc() {
    time for i in *.png; do
        echo "$i : Resizing image..."
        # Bill's color-hybrid script
        # convert -define png:color-type='6' -resize 512x  -extent 512x512 -gravity center -background none "$i"  "../../PNGs/PNG_Color_Hybrid_512x512/$i"

        # Bill's metacritic script
        # mogrify -define png:color-type='6' -resize x256 *.png

        # My hero logo script
        # mogrify -background none -define png:color-type='6' -gravity center -extent 1024x768 -path ../bar/ *.png

        # mogrify -define png:color-type='6' -resize 256x -gravity center -path ../mogrify/ *.png
        # convert -define png:color-type='6' -resize 256x -gravity center "$i" "../convert/$i"
        mogrify -define png:color-type='6' -path ../mogrify-no-resize/ *.png
    done;

}
alias do-mc=doMc



# SASS Aliases #########

alias compass-prod="compass compile --output-style compressed --force"


# OVP Aliases #########

runOvp() {
   cd ~/sites/ovp2
   # gulp run-ovp --env=sitb --skipGetPlayer --features="feature.rdvr2_enabled=true" --features="feature.rdvr2_is_default=true"
   # gulp run-ovp --env=dev
   gulp run-ovp
}
alias run-ovp=runOvp

runOvpSit() {
  cd ~/sites/ovp2
  gulp run-ovp --env=sitb
}
alias run-ovp-sit=runOvpSit



flushOvp() {
  sudo pfctl -F all
}
alias flush-ovp=flushOvp
