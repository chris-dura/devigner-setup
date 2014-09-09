devigner-setup
==============

Generic development environment setup for **Designers** on a Macbook Pro running Mavericks.

# Why not use Migration Assistant?
1. I like starting from scratch and only installing the things I need right now, instead of carrying over all the outdated stuff that accrues over the years.
2. A number of people I have talked to (designers and developers alike) have had mixed success with using **Migration Assistant**. Some have claimed it sometimes has problems with "dot files", others have had problems due all the enterprise security and encryption hula-baloo that our IT department is required to install. Regardless, I've personally decided **Migration Assistant** is a 50/50 proposition, so I just don't mess with it.
3. That being said, **Time Machine** still works beautifully to move individual files to my new machine, so I always start the process by making sure I have a clean, full **Time Machine** backup of my old laptop.

# 1. Install Xcode and its command-line tools

Go to the **App Store** and install **Xcode**. In previous versions of **Xcode**, you had to download and install the command-line tools separately, but after installing **Xcode** on my brand new machine, it seems that they're now included by default.
To make sure (pun intended), just open a new Terminal window and type `make --version`. If you get something like below, you should be good.

```bash
$ make --version
GNU Make 3.81
Copyright (C) 2006  Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.
```

# 2. Shell (Terminal) configuration
I have a profile with a few aliases and things that make some of the following steps a little easier. I've included my `~/.profile` in this repo for reference.

# 3. Create `~/.local/opt` folder
The `~/.local/opt` folder is where I put tools that I install in an "ad-hoc" fashion.
In other words, they're not managed by an automagical package manager like [Homebrew](https://github.com/wilmoore/homebrew-home) or some such.
This is an arbitrary convention that sort of mirrors how Apple uses a different `/opt` folder on your system.
But, you could name this folder anything you want like `~/.foo/bar`, just make sure to add it to your `$PATH`.

```bash
# ~/.profile

export PATH=$HOME/.local/opt:$PATH

```

# 4. Install [Homebrew](https://github.com/wilmoore/homebrew-home)

I've chosen to use the ["Homebrew @ $HOME"](https://github.com/wilmoore/homebrew-home) method of installing Homebrew, instead of what you see on Homebrew's [home page](http://brew.sh/). @wilmoore details his rationale and thinking behind this perfectly valid method of installing Homebrew, but you can do it either way.

# 5. Install [Git](http://git-scm.com/book/en/Getting-Started-Installing-Git)
As far as I can tell, installing Homebrew above, also installs Git.
```bash
$ git --version
git version 2.1.0

```

# 5. Create `~/Sites`
Once upon a time OS X came with a folder called "Sites". This was the default location that would open when you used your Macbook like a web server. That folder has since become somewhat defunct, because Apple wants you to buy the extra OS X Server app from the store.

But, there's nothing stopping you from manually creating it in your HOME directory. You can really name the folder anything you want, like "Projects". If you name it "Sites", you'll get the little extra icon stamped on the folder... which, of course, you could copy to a different folder of your choosing: http://support.apple.com/kb/PH13922

# 6. Set up Git

GitHub has great Help files on [setting up Git](https://help.github.com/articles/set-up-git). At a minimum, you probably just need to set up your username. I typically prefer to [keep my email private](https://help.github.com/articles/keeping-your-email-address-private) and set the global config as my personal GitHub.com account ([@chris-dura](https://github.com/chris-dura)), and if I have enterprise projects where I need to use a different account, I'll set that on a per repo basis.

And, I also [cache my GitHub password](https://help.github.com/articles/caching-your-github-password-in-git) to make cloning easier.

# 7. Clone your repos
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
```

# 8. Install [MAMP](http://www.mamp.info/en/)
More saavy users may have a need to run specific web server configurations, but MAMP is the easiest way I've found to get a web server up and running. Download MAMP (free), change the ports to 80 and 3306, select the `~/Sites` folder as your document root, click *Start Servers*. Now, open Chrome and browse to http://localhost/ and you should see the `Sites` directory listing... it works!



