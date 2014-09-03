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

