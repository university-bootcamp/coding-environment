Mac Setup with Vagrant
==================

This will run you through the steps to configure your web development environment using the vagrant install process.

IMPORTANT: READ THIS!
---------

If you're running Parallels, VirtualBox, or VMWare to run Windows (for example to run Microsoft
Word inside Windows on your Mac) make sure to close Parallels before going through these steps.  Parallels does not
play nicely with Vagrant.


Step 1: Create accounts if you haven't already
--------

**Note:** These websites may ask you if you want to also download the software programs to go along with the accounts (The Heroku ToolBelt, GitHub for Windows, or GitHub for Mac).  We won't be using these programs so you won't need to download them.

### Part A

First go to [GitHub.com](http://github.com) and create an account.

### Part B

Then go to [Heroku.com](http://Heroku.com) and create an account there as well.


Step 2:  Get the files for your development environment
-----------

Download and unzip the following file: [vagrant.zip](https://github.com/FirehoseProject/firehose-vagrant-rails5/raw/master/tools/vagrant.zip?raw=true) to your __Desktop__. Unzip the file, it will create a folder called `vagrant` on your Desktop.  This is where all your web development environment will live.

Step 3: Install the tools
-------


* Go to the [VirtualBox Website](https://www.virtualbox.org/wiki/Downloads), click the link to Download "OS X hosts".  Open the dmg file that downloads, then double click on VirtualBox.pkg that pops up and follow the instructions (you're clicking continue most of the time).  Once you go through that step close out the "VirtualBox" window.
* Go to the [Sublime Text Editor Website](http://sublimetext.com/) and click "Download for Mac".  Open the file and [drag the Sublime Text program into the Applications folder](http://i.imgur.com/pgjF3WL.png), then launch the program by going into your _Launch Pad_ and finding "Sublime Text".  (Note: This may say that this is from an [unidentified developer and is unallowed, to continue](http://i.imgur.com/FNTYmyL.png) if this happens open Launch Pad > System Preferences > Security & Privacy and click [open Anyway](http://i.imgur.com/XPVpfRf.png). )  It will probably tell you ["Sublime Text" is an application downloaded from the internet. Are you sure you want to open it?](http://i.imgur.com/bjtmqkw.png)  Press **Open**.  This will launch the Sublime Text editor, and you'll be good.  If you need more help check out [this Sublime Text install video](https://vimeo.com/88292868) we made.
* Go to the [Vagrant Download Page](http://www.vagrantup.com/downloads.html), click Find the Mac OS X section and click "Universal (32 and 64-bit)".  Run the file you downloaded and follow the instructions (you're clicking next most of the time)
* Restart your computer if you're prompted to.


Step 4: Turn on your Web Dev Environment
--------

Open up the **Terminal Window**: Hold Command+Spacebar, in the Spotlight type 'Terminal' and hit the enter key.

A terminal window will come up, and then run the following two commands:

```
cd ~/Desktop/vagrant
```

Then type this command.  It will need to download a large file, so it will take a few moments to complete:

```
vagrant up
```

**NOTE:** If this comes back with an error message telling you to run `vagrant init` DO NOT DO THAT.  See this post [here](https://workspace.thefirehoseproject.com/comments/48) for details about how to fix this error message.

Step 5: Log into your dev environment
-----------

To log into your web-dev environment follow the following steps:

__First__:  After `vagrant up` finishes, in the terminal type:

```
vagrant ssh
```

__Second__: Then you'll be prompted with a terminal window inside your web
development environment that looks like this:

![web-dev-environment](http://i.imgur.com/UdZvZTj.png)

This brings you into your web dev environment ready to run commands.


Step 6: Accounts
------------

#### Generate SSH Key

 Inside the web development terminal window, where it says `[Web Dev]` in blue, run the following lines one by one. _important note: the command has backticks (`) not single-quotes ('), either copy and paste the command or if you type it use the key to the left of the 1 to type the backtick in the first line_:

```
eval `ssh-agent -s`
```
```
ssh-keygen -t rsa -C "Firehose Vagrant" -N '' -f ~/.ssh/id_rsa
```
```
ssh-add ~/.ssh/id_rsa
```

#### Configure Heroku with SSH Keys
First we need to update the `heroku-cli` with the following command:

```
wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh

```

Next, we will need to log into our heroku account in this coding environment.
This will prompt you for your Heroku email and password.
Run the following command to start to initiate the login process,
then enter your email and password when you're prompted for it:

```
heroku login
```
Finally, we need to add our ssh key to our heroku account:

```
heroku keys:add
```

#### Configure Github with SSH Keys

Then run this command.  Once this command runs it will prompt you for your GitHub username (note this is your username not your email address) and your password.  Enter these values and then press enter.  It should tell you "ok!".  If it gives you an error message you probably entered an invalid username and password (so try to run that command again).

```
curl https://gist.githubusercontent.com/kenmazaika/fa8ea7dfbae413638cfd111b974bc74a/raw/ecb5e91c044d92389d0cfd3c2229e57187384d6d/github_auth.rb  > ~/.firehose-github.rb && ruby ~/.firehose-github.rb
```

Once the dollar-sign returns, run these commands and provide your name and email address inside the double quotes instead of the dummy data:

```
git config --global user.email "you@example.com"
```

And then run:

```
git config --global user.name "Your Name"
```

##Amazon AWS services##

_We need an amazon developer account for some image storage space on Amazons S3 service (this will cost you nothing)_

* Sign-up and create an account for [Amazon Web Services](http://aws.amazon.com/). Anything we'll do during this course will cost you nothing, so don't worry about your credit card being charged.


Step 7: Test
---------

 In the web development terminal window,  where it says `[Web Dev]` in blue, run this, _important note: after you run `rails s` it won't give you the prompt to continue to enter commands. This is by design, so move onto the next step even if it looks like it's just hanging_:

```
cd /vagrant/src/firehose-test-app
```
```
rails s -b 0.0.0.0 -p 3000
```


Open a web browser on your computer and go to: [http://127.0.0.1:3030](http://127.0.0.1:3030).  You should see the welcome aboard page come up.


Step 8: Stop your rails server
-------------

Now return to a window where you can enter commands in web development terminal window.

**Find your web development terminal where you ran the `rails server` (rails s) command and hold CTRL+C.**

This stops the webpage from working, but will allow you to enter new commands.


Step 9: Know your web development environment
---------------


Knowing and understanding how to connect to your web development environment when you want to start coding is pretty important.

**Go to our [FirehoseProject Vagrant Intro Guide](http://workspace.thefirehoseproject.com/cheat-sheets/vagrant-intro) and get comfortable with your web development environment.**
