# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/CDura/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Environment variables #########

# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home"

# Added in GitLab GDK setup
export PATH="/usr/local/opt/postgresql@9.6/bin:/usr/local/opt/node@10/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Try to use local (project) module first
export PATH=./node_modules/.bin:$PATH
# This would allow for using a local module, regardless of where in the repo you `cd`
# export PATH=$(npm bin):$PATH coffee
# You could alias the above like
# alias npm-exec='PATH=$(npm bin):$PATH'
# ... then something like this would execute the local `coffee`
# npm-exec which coffee

# Configure/run node version manager
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Add Yarn to path
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Configure `chruby` so that `chruby` Terminal commands work
# source $(brew --prefix chruby)/share/chruby/chruby.sh
source /usr/local/share/chruby/chruby.sh
# Change the default version of ruby
# Can also be done by enabling auto-switching in `chruby`, and
# using a `.ruby-version` file.
chruby 2.5.3


# Aliases #########

# Open this profile file with Sublime Text
#alias openprofile='open ~/.profile'
# alias open-profile='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ~/.profile'
alias open-profile='code ~/.zshrc'

# Open hosts file with Sublime Text
#alias openprofile='open ~/.profile'
# alias open-hosts='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /private/etc/hosts'
alias open-hosts='code /private/etc/hosts'

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

# Show globally installed npm packages
npmListGlobal() {
  npm list -g --depth=0
}
alias npm-list-g=npmListGlobal

# Kill a port
# usage: $ killport 5280
killPort() {
  kill $( lsof -i:$1 -t )
}
alias killport=killPort


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

# Clone and set user to charter email
# usage: $ charter-clone {group-name} {repo-name}
charterClone() {
  cd ~/code && git clone git@gitlab.spectrumxg.com:$1/$2.git && cd $2 && git config user.email "chris.dura@charter.com"
}
alias charter-clone=charterClone

# Find diff from accidentally dropped stashes
# ref: https://stackoverflow.com/questions/89332/how-to-recover-a-dropped-stash-in-git
# usage: $ recover-stash
recoverStash() {
  gitk --all $( git fsck --no-reflog | awk '/dangling commit/ {print $3}' )
}
alias recover-stash=recoverStash

# FFmpeg Aliases #########

convertToWebM() {
  # ffmpeg -i input-file.mp4 -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis output-file.webm
  ffmpeg -i $1 -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis $2
}
alias convert-to-webm=convertToWebM


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
