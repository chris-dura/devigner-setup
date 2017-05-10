
devigner-setup
==============

[![License](http://img.shields.io/:license-MIT-blue.svg)](LICENSE)

Generic development environment setup for **Designers** on a Macbook Pro running OS X Yosemite.

# Why not use Migration Assistant?
1. I like starting from scratch and only installing the things I need right now, instead of carrying over all the outdated stuff that accrues over the years.
2. A number of people I have talked to (designers and developers alike) have had mixed success with using **Migration Assistant**. Some have claimed it sometimes has problems with "dot files", others have had problems due all the enterprise security and encryption hula-baloo that our IT department is required to install. Regardless, I've personally decided **Migration Assistant** is a 50/50 proposition, so I just don't mess with it.
3. That being said, **Time Machine** still works beautifully to move individual files to my new machine, so I always start the process by making sure I have a clean, full **Time Machine** backup of my old laptop.

# Stuff to do _before_ you wipe the Macbook
There's some things that need to be manually taken care of because they may be lost entirely, or it's just a pain to get them back by searching through the dregs of the Time Machine.
#### SourceTree
- Push your outstanding stashes up to branches on the `origin`, so you can grab them later.

#### Sublime Text 3
- Make sure to save off any unsaved files stored in the session buffer, so that they can be backed up by Time Machine and loaded back in later.
- Search History will also be lost, so if there are complicated excludes or what-not, you should quickly make a note of them.
- Preferences can be found in `~/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings`, but it doesn't take much to set it up again.

# Install Xcode and its command-line tools

Running the command below will launch a popup where you can install just the commmand line tools, or download Xcode from the app store.
```bash
$ xcode-select --install
```

# Shell (Terminal) configuration
I have a profile with a few aliases and things that make some of the following steps a little easier. I've included my `~/.profile` in this repo for reference.

# Create `~/Sites`
Once upon a time OS X came with a folder called "Sites". This was the default location that would open when you used your Macbook like a web server. That folder has since become somewhat defunct, because Apple wants you to buy the extra OS X Server app from the store.

But, there's nothing stopping you from manually creating it in your HOME directory. You can really name the folder anything you want, like "Projects". If you name it "Sites", you'll get the little extra icon stamped on the folder... which, of course, you could [copy to a different folder](https://support.apple.com/kb/PH19073?locale=en_US) of your choosing.

# Install [Git](http://git-scm.com/book/en/Getting-Started-Installing-Git)
Git is the preferred version control system.

# Install [Homebrew](http://brew.sh/)
**Update: I don't use Homebrew anymore, all the tools are better installed via other methods like *cURL*.**

In the my latest incarnation of environment, I've gone with the default method of installing Homebrew.

However, I've previously used the ["Homebrew @ $HOME"](https://github.com/wilmoore/homebrew-home) method of installing Homebrew, instead of what you see on Homebrew's [home page](http://brew.sh/). @wilmoore details his rationale and thinking behind this perfectly valid method of installing Homebrew, but you can do it either way.

# Install [chruby](https://github.com/postmodern/chruby)

**Update: I've successfully removed my dependency on Ruby tools; however, if I still need `chruby`, it's better to install it via methods other than Homebrew.**

As a web designer, I encounter and use a handful of Ruby-based tools on a daily basis for any given project. So, even though I don't actively develop in the Ruby language, I still need to manage Ruby tools and versions. `chruby` allows switching of different Ruby versions between projects and makes Ruby dependency management much simpler.

```bash
# Install `chruby`
$ brew install chruby
```
You also need to add the `chruby` script to your `~/.profile`.
```bash
# ~/.profile

# Configure `chruby` so that `chruby` Terminal commands work
source $(brew --prefix chruby)/share/chruby/chruby.sh
```

# Install [ruby-install](https://github.com/postmodern/ruby-install) with Homebrew
- `chruby` is just a Ruby "switcher", so you still need a tool that installs different Ruby versions. Generally, you want to install different Ruby versions because you usually won't have permission to write to the system Ruby that comes pre-installed in OS X anyway, so using `ruby-install` allows you to do things like `gem install scss-lint` and install gems without errors.
- You can install Ruby with Homebrew, too, but when using `chruby`, the most common method is to use `ruby-install` instead of Homebrew... I don't know why, probably because they're both maintained by @postmodern.
- ~~It appears that `ruby-install` creates a `~/src` folder in your home. It's ugly, but I don't know if it's needed or not.~~ The `~/src` folder (or at least its contents) will be cleaned up by passing the `--cleanup` option in the command line.

```bash
# Install `ruby-install`
$ brew install ruby-install
# Install latest stable Ruby to `~/.rubies`
$ ruby-install ruby --cleanup
```

# Install [NVM](https://github.com/creationix/nvm) and [NodeJS](https://nodejs.org/)

**Update: Do not install NVM via Homebrew, use the instructions on NVM's documentation.**

For now, I only use NodeJS on one project, but it's ~~gaining in popularity~~ the industry standard, and NVM is the defacto way of managing different NodeJS versions across projects.

```bash
# install nvm according to their documentation
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
...
# follow additional instructions, like add `.nvm` and copy `nvm-exec`, etc...

# Now, install the latest stable release of NodeJS
$ nvm install node
# OR, install a specific version of NodeJS
$ nvm install 0.10

# set every new shell to use the stable verison of node
$ nvm alias default node
# use a particular version of node for this shell
$ nvm use 0.10.26
```

## Update [NPM](http://www.npmjs.com)
NPM (node package manager) comes installed with nvm/Node; however, npm updates much more frequently, so it's best to make sure you have the latest version. Installing/updating npm via Homebrew has been known to cause some issues, so use the [recommended method](https://docs.npmjs.com/getting-started/installing-node) to update to the latest version of npm.
```bash
# update npm to latest version
$ sudo npm install npm -g
```

## Installing npm packages globally
TODO: document this.

If you try to install an npm package globally, and you see permission or access errors, such as `EPERM` or `EACCESS`, do not use sudo as a work-around.

Look at the following Guides:
https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
https://docs.npmjs.com/getting-started/fixing-npm-permissions

# Installing gems
Gems are installed to whichever ruby you're using at the time. The below snippet shows how installing to a specific ruby version works, and switching out of that version, you can no longer get the tool.

```bash
$ ruby --version
ruby 2.1.2p95
$ gem install scss-lint
$ scss-lint --version
scss-lint 0.27.0

# Switch to the system ruby
$ chruby system
$ ruby --version
ruby 2.0.0p453
$ scss-lint --version
-bash: scss-lint: command not found
```
So, you probably want your to configure your Terminal to open to a specific version of Ruby that isn't the system ruby (most likely what you installed in `ruby-install`).
Adding the `chruby` command to your `.profile` will cause every new **Terminal** session to use the specified ruby, in this case `ruby-2.1.3`.

```bash
# ~/.profile

chruby 2.1.3
```

# Install [Bundler](http://bundler.io/)
Bundler is the easiest way to install/use different gems and gem versions on a per-project basis. All versions of a particluar gem are still installed "globally", however when in the project folder, the `bundle-exec` command allows you to target a particular gem version.
```bash
# Install bundler
$ gem install bundler
# navigate to the project
$ cd projects/foo
# install the gems needed for the `foo` project
$ bundle install
# execute the gem specific to the `foo` project
$ bundle-exec scss-lint --version
scss-lint 0.27.0
# Or, execute the most newest version of the gem
$ scss-lint --version
scss-lint 0.31.0
```

# Set up and configure Git
GitHub has great Help files on [setting up Git](https://help.github.com/articles/set-up-git). At a minimum, you probably just need to set up your username. I typically prefer to [keep my email private](https://help.github.com/articles/keeping-your-email-address-private) and set the global config as my personal GitHub.com account ([@chris-dura](https://github.com/chris-dura)), and if I have enterprise projects where I need to use a different account, I'll set that on a [per repo](https://help.github.com/articles/setting-your-username-in-git/) basis.

And, I also [cache my GitHub password](https://help.github.com/articles/caching-your-github-password-in-git) to make cloning easier.

# Clone your repos
Clone all your projects into that `~/Sites` (or whatever) folder you created.
```bash
# Change to `sites` directory
$ cd sites
# Clone your fork
$ git clone https://github.com/chris-dura/scss-lint.git
```
Different projects might have different workflows, but my typical setup is to set the `origin` as my fork, and `upstream` is the parent repo.

```bash
# Change to the repo
$ cd scss-lint
# Set the origin as your fork
$ git remote add origin https://github.com/chris-dura/scss-lint.git
# Set the upstream as the parent repo
$ git remote add upstream https://github.com/causes/scss-lint.git
# Verify the remotes are set up properly
$ git remote -v
origin	https://github.com/chris-dura/scss-lint.git (fetch)
origin	https://github.com/chris-dura/scss-lint.git (push)
upstream	https://github.com/causes/scss-lint.git (fetch)
upstream	https://github.com/causes/scss-lint.git (push)
```

# Install [MAMP](http://www.mamp.info/en/)
More saavy users may have a need to run specific web server configurations, but MAMP is the easiest way I've found to get a web server up and running.
- Download MAMP (free)
- Launch MAMP and open **Preferences...**
- Change the web and MySQL ports to 80 and 3306
- Set Web Server to the `~/Sites` folder as your document root
- Click **Start Servers** and browse to http://localhost/ and you should see the `Sites` directory listing... it works!

# Set up Sublime Text
The CSSComb plugin needs to have a symlink to node in `/usr/local/bin`, see [sublime plugin](https://github.com/csscomb/sublime-csscomb) for docs.

----

Actually haven't done this in the latest incarnation of my environment...

# Create `~/.local/opt` folder
The `~/.local/opt` folder is where I put tools that I install in an "ad-hoc" fashion.
In other words, they're not managed by an automagical package manager like [Homebrew](http://brew.sh) or some such.
This is an arbitrary convention that sort of mirrors how Apple uses a different `/opt` folder on your system.
But, you could name this folder anything you want like `~/.foo/bar`, just make sure to add it to your `$PATH`.

```bash
# ~/.profile

export PATH=$HOME/.local/opt:$PATH

```

----

## Inspiration
Heavily influenced by many helpful conversations with [@wilmoore](https://github.com/wilmoore), and https://github.com/wilmoore/macbook.


