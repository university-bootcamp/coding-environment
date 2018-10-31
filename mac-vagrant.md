# Vagrant Web Development Setup for Apple Macintosh Computers

In this step, we will install, configure and test your vagrant web development environment.  At the end of this process, you will see a web application that is running from within this environment active inside your web browser.

> **Note:** Make sure to close any other virtualization environments you have running.  If you happen to be running Parallels, VirtualBox or VMWare for other reasons, you will need to close them.

Follow the following steps to install and use your vagrant environment.

## Step 1: Get the files

Your vagrant virtual machine will need a variety of files to set this up.

* **Download and unzip** [coding-environment.zip](https://github.com/university-bootcamp/coding-environment/archive/coding-environment.zip) to your `Desktop` folder.

**Note:** _This folder will become the folder where your web development environment and source code will be used._

## Step 2: Install three programs

There are three programs you will need to install to setup your environment:  Sublime text, VirtualBox and vagrant.

### Program 1 — Sublime Text Editor

> You may have already installed this program, but if you haven't follow these steps.

**First**, visit the [Sublime Text Editor Website](http://sublimetext.com/) and click "Download for Mac".  

**Second**, open the file and [drag the Sublime Text program into the Applications folder](http://i.imgur.com/pgjF3WL.png), then launch the program by going into your _Launch Pad_ and finding "Sublime Text".  

> **Note:** When you follow this step, you may be presented with an error because this program wasn't installed from the App Store.  The error may [look like this](http://i.imgur.com/FNTYmyL.png).
> 
> If this happens do the following:
> * open Launch Pad 
> * navigate to `System Preferences > Security & Privacy`
> * Click the [Open Anyway](http://i.imgur.com/XPVpfRf.png) option.
> 
> If you see an error that _"Sublime Text" is an application downloaded from the internet. Are you sure you want to open it?_ [(screenshot)](http://i.imgur.com/bjtmqkw.png), press the **Open** button.  
> 
> This will launch the Sublime Text editor, and you'll be good.  
> 
> If you need more help check out [this Sublime Text install video](https://vimeo.com/88292868) that shows how to do this.

### Program 2 — VirtualBox

**First**, visit the [VirtualBox Website](https://www.virtualbox.org/wiki/Downloads), click the link to Download "OS X hosts".  

**Second**, Open the dmg file that downloads, then double click on VirtualBox.pkg that pops up and follow the instructions (you're clicking continue most of the time).  Once you go through that step close out the "VirtualBox" window.

### Program 3 — Vagrant

**First**, visit the [Vagrant Download Page](http://www.vagrantup.com/downloads.html), click Find the Mac OS X section and click "Universal (32 and 64-bit)".  Run the file you downloaded and follow the instructions (you're clicking next most of the time)

**Finally**, restart your computer if you're prompted to.

## Step 3: Starting Your Virtual Machine

The previous steps installed all the programs that were needed to use a vagrant virtual machine.  The next step will run through the steps of turning the environment on for the first time.

Turning on your virtual environment will take a bit longer than usual on the first time.

**Open the terminal** on your computer.  To do this, hold the `Command+Spacebar` keys to open the spotlight.  Then type `Terminal` and press the enter key.  This will open a terminal window.

You will need to run two commands in your terminal windows.

**First**, run the following command to change your working directory, to make it so you're working with the web development environment you downloaded earlier.

```
cd ~/Desktop/coding-environment
```

**Second**, you will need to run the command to turn on your virtual computer environment.

> **Note**:  this command will require you to download a file that is hundreds of megabytes long.  Make sure you are on a strong Internet connection before you run this command.

Run the following command — and **after the command completes, read the next section before you run another command.**

```
vagrant up
```

### IMPORTANT: Read this before running any additional commands.

The previous command may complete with a variety of messages.  **It also may instruct you to run commands that will cause problems in your environment**: so make sure to read this section before doing anything.

**[SUCCESS] — Everything is successful.**

If everything is successful you will see output that looks like the following.

![Screenshot](images/success-vagrant-mac.png)

If you see this, continue to **Step 4**: vagrant has been installed and started as expected.  If this isn't what your screen looks like, continue below and find the message that matches the output you're seeing.

**[ERROR] — `Vagrant environment or target machine` error message` shown.**

The command may come back with an error message suggesting that you run the `vagrant init` command. **Do not run this command*.

The error message will look like this:

![Screenshot](images/vagrant-init.png)

**If you see this error**, _**[click here to understand and fix the problem so the `vagrant up` command works](https://workspace.thefirehoseproject.com/comments/48)**_.

**[ERROR] — `vagrant up` failed.**

[send back to cloudide].


**[SOMETHING ELSE]**

Maybe ask a TA

## Step 4: Log into your dev environment

To log into your web-dev environment follow the following steps:

__First__:  After `vagrant up` finishes, in the terminal type:

```
vagrant ssh
```

__Second__: Then you'll be prompted with a terminal window inside your web
development environment that looks like this:

![web-dev-environment](http://i.imgur.com/UdZvZTj.png)

This brings you into your web dev environment ready to run commands.


## Step 5: Accounts

### Step 5A: Generate SSH Key

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

### Step 5B: Configure Heroku with SSH Keys
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

### Step 5C: Configure Github with SSH Keys

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


## Step 6: Test

 In the web development terminal window,  where it says `[Web Dev]` in blue, run this, _important note: after you run `rails s` it won't give you the prompt to continue to enter commands. This is by design, so move onto the next step even if it looks like it's just hanging_:

```
cd /vagrant/src/firehose-test-app
```
```
rails s -b 0.0.0.0 -p 3000
```


Open a web browser on your computer and go to: [http://127.0.0.1:3030](http://127.0.0.1:3030).  You should see the welcome aboard page come up.


## Step 7: Stop your rails server

Now return to a window where you can enter commands in web development terminal window.

**Find your web development terminal where you ran the `rails server` (rails s) command and hold CTRL+C.**

This stops the webpage from working, but will allow you to enter new commands.


## Step 8: Know your web development environment


Knowing and understanding how to connect to your web development environment when you want to start coding is pretty important.

**Go to our [FirehoseProject Vagrant Intro Guide](http://workspace.thefirehoseproject.com/cheat-sheets/vagrant-intro) and get comfortable with your web development environment.**
