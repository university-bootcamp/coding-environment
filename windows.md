Windows Setup with Vagrant
==================

This will run you through the steps to configure your web development environment using the vagrant install process.

Step 1 - Create accounts if you haven't already
--------

**Note:** These websites may ask you if you want to also download the software programs to go along with the accounts (The Heroku ToolBelt, GitHub for Windows, or GitHub for Mac).  We won't be using these programs so you won't need to download them.

### Part A

First go to [GitHub.com](http://github.com) and create an account.

### Part B

Then go to [Heroku.com](http://Heroku.com) and create an account there as well.

Step 2:  Get the files for your development environment
-----------

Download and unzip the following file: [coding-environment.zip](https://github.com/university-bootcamp/coding-environment/archive/coding-environment.zip) to your __Desktop__. Unzip the file onto your Desktop, so it creates a folder called `coding-environment` on your Desktop.  This is where all your web development environment will live.

Step 3: Install the tools
-------

* Go to the [VirtualBox Website](https://www.virtualbox.org/wiki/Downloads), click the link to Download "Windows hosts".  Find the VirutalBox.exe file you just downloaded in your internet browser.  Right-click the VirutalBox.exe, press "Run as Administrator", and follow the instructions (you're clicking next most of the time). If you are on Windows 10 or upgrade to Windows 10, make sure to have the latest VirutalBox version.
* Go to the [Sublime Text Editor Website](http://sublimetext.com/) and click "Download for Windows".  Once the program downloads, find the file in Windows Explorer and right click the file, click "Run as Administrator" and follow the instructions (you're clicking next most of the time)
* Download [Putty SSH Client](http://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html), copy the putty.exe file onto your desktop (that way you can start things up quickly)
* Go to the [Vagrant Download Page](http://www.vagrantup.com/downloads.html), click Find the Windows section and click "Universal (32 and 64-bit)".  Run the file you downloaded and follow the instructions (you're clicking next most of the time)
* Restart your computer if you're prompted to.


Step 4: Turn on your Web Dev Environment
--------

Open up the **Windows Command Prompt**: click the **Start** button ![Picture of the Start button](http://imgur.com/GFYgPUT.png). In the Search box, type _Command Prompt_, and then, in the list of results, double-click Command Prompt.

A command prompt will come up, and then run the following two commands:

```
cd Desktop\vagrant
```

Then type this command.  It will take a few moments to complete (it needs to download a very large file):

```
vagrant up
```

This `vagrant up` command takes several minutes to complete, so wait until it finishes and the window is ready to accept more input.  Once it completes, close the Command Prompt window (you can click the red X in the top corner).

**NOTE:** If this comes back with an error message telling you to run `vagrant init` DO NOT DO THAT.  See this post [here](https://workspace.thefirehoseproject.com/comments/48) for details about how to fix this error message.


Step 5: Log into your dev environment
-----------

Launch the **Putty** application that was placed onto your Desktop by double clicking it.

Open up putty

* In the **Host Name** (or IP Address) enter: 127.0.0.1
* In the **Port** to the right of the host name enter: 2222
* Press the **Open** button.
* _You may be prompted with a [PuTTY Security Alert](http://i.imgur.com/Nw2Th29.gif), asking if you trust the connection.  If this comes up press **Yes** to continue and stop prompting you with this warning._
* You will be prompted for a user.  Enter: __vagrant__
* You will be prompted for a password.  Enter: __vagrant__

**NOTE:** If this comes back with an error message that says "network connection refused" see [this guide](https://workspace.thefirehoseproject.com/comments/45) about how to fix that.

Step 6: Accounts
------------

#### Generate SSH Key

 Inside the putty window run, _important note: the command has backticks (`) not single-quotes ('), either copy and paste the command or if you type it use the key to the left of the 1 to type the backtick in the first line_:

 **Copy and Pasting**: If you want to paste something into the Putty, CTRL+C to put something on your clipboard, then move your mouse/cursor over the putty window and right-click.

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

* Sign-up and create an account for [Amazon Web Services](http://aws.amazon.com/). Anything we'll do over the weekend will cost you nothing, so don't worry about your credit card being charged.


Step 7: Test
---------

 In the putty window run this, _important note: after you run `rails s` it won't give you the prompt to continue to enter commands. This is by design, so move onto the next step even if it looks like it's just hanging_:

```
cd /vagrant/src/firehose-test-app
```
```
rails s -b 0.0.0.0 -p 3000
```


Open a web browser on your computer and go to: [http://127.0.0.1:3030](http://127.0.0.1:3030)


Step 8: Stop your rails server
-------------

Now return to a window where you can enter commands in web development terminal window.

**Find your web development terminal where you ran the `rails server` (rails s) command and hold CTRL+C.**

This stops the webpage from working, but will allow you to enter new commands.



Step 9: Know your web development environment
---------------


Knowing and understanding how to connect to your web development environment when you want to start coding is pretty important.

**Go to our [FirehoseProject Vagrant Intro Guide](https://workspace.thefirehoseproject.com/cheat-sheets/vagrant-intro) and get comfortable with your web development environment.**
