# Apple Macintosh Development Environment setup

These instructions will install a web development coding environment on your machine and set up all the required accounts that you will need on your Apple Macintosh computer.

## Step 1: Create web development accounts

You will need to use three different services in the process: GitHub, Heroku & Amazon Web Services (AWS).

> **Note:** You may be prompted if you want to install programs on your machine when setting up GitHub and Heroku account — you will not need to install these programs yet.

### GitHub

GitHub is a service that will allow you to collaborate and back-up your code.  You will need to create an account on this site.

**First**,  _**[visit GitHub.com](http://github.com)**_ and create an account.

### Heroku

Heroku is a service that will allow you to put your project live on the Internet.  You will need to create an account on this site.

**Second**, _**[visit Heroku.com](http://Heroku.com)**_ and create an account.


### Amazon Web Services

Amazon Web Services provides web services that can plug into the web applications that you use.  In this course, we will be using the `Amazon S3` storage service for storage space for image and video uploading.

**Third**, [create an account on Amazon Web Services](http://aws.amazon.com/).  Although you will need to enter your credit card information to verify your account, AWS provides a free tier of the services that we will use in throughout the course.

The free tier on AWS will be more than enough for all the needs in this course.

## Step 2: [Suggested] Setup vagrant

Vagrant is a program that will allow you to run a virtual machine on your computer — and within this virtual machine you can run your web application projects.

This next step is the suggested install process.  Some computers do not work well with vagrant — if this happens using an alternative could be helpful.

**Next**, _**[click here to setup your vagrant environment on your Mac](mac-vagrant.md)**_.

## Step 2: [Alternative] Setup a Cloud IDE

> **If you setup an environment with vagrant successfully, you can skip this step.**

Sometimes, when trying to set up virtual computers on your machine problems will arise.  At these times, it is often the best solution to use a Cloud IDE solution.

Cloud IDEs will give you a professional coding environment all within your web browser.  There are a number of reasons to use Cloud IDEs.

* They can work regardless of the computer you're using if you can visit sites inside your web browser.
* They provide the flexibility to log into your environment from different computers.
* Since everything will be access through a browser, they often can work with unusual Internet, firewall or restrictions from your ISP & router.

Since these Cloud IDEs will give you the full power of a linux virtual machine that is accessible within a web browser, this is a great option to set up a coding environment with, also.

**Alternatively**, **_[click here to use a CloudIDE to use your coding environment](cloud-ide.md)_**.

## Step 3:  Understand your environment

By following these steps you have installed a coding environment and tested that it is working as expected.  Since there are different options to choose for a coding environment some of the steps you need to use the environment may have slight changes you need when following the instructions.

Since the different coding environments are each a little different depending on the choices you've made in the previous steps, following the instructions could be a little different.

Here are the details that you will need to know about how to use the different coding environments when following through web development instruction materials.

### Vagrant

The following information will be important for you to know about the installation process you just finished if you are using the vagrant setup before beginning to use it.

1. Between each of the coding sessions you do, especially if you restart your machine, you will need to run the command to start your vagrant environment prior to connecting.

```
vagrant up
```

2. When this command completes, either run the `vagrant.command` program or run the command `vagrant ssh` to log into your terminal using vagrant.

After this completes you will be taken to a coding environment inside your virtual machine, and the command will show `[ENV]`.

3. Before starting any new projects it can be helpful to start fresh.

If you notice any Ruby on Rails servers that are still running from either the install process or a different application, you should close them, to give you a fresh start.

**To ensure that your server is not running** — if you visit the URL `localhost:3030` in your browser, you should not see a web page load.  You should ensure that your server is not running before starting new server windows.

**If you ever want to preview the application that is running within your coding environment** — visiting the `localhost:3030` within your environment will allow you to do this.

**Location of project files** — when using this vagrant environment, most people will store the code for their specific projects in the folder in the location `/vagrant/src` inside their coding environment.

All the files within this folder inside the vagrant environment will be automatically synced outside the vagrant environment to folder inside the `coding-environment/src` folder that is located outside the virtual machine, usually on your _Desktop_.

### Cloud IDE — Important Things to Know!

The following information will be important for you to know about the installation process you just finished if you are using a Cloud IDE setup.

**If you ever want to preview the application that is running within your coding environment** — you will need to...

[STEPS HERE]

_**If you ever see instructions that tell you to visit the URL `localhost:3030` and you are using a CloudIDE**_ — instead you should make sure to follow the steps above to preview the web application in your coding environment.

**Location of project files** — when using this coding environment, most people will store the code for their specific projects in the folder in the directly in the home folder of their environment.

_**If you ever see instructions that suggest changing your directory or using the `/vagrant/src` folder**_ — you should rather use the folder where your code lives instead.  This will usually involve changing the directory to the home folder, using the `cd ~` command, instead.

## Your environment setup process is now complete!

Your coding environment is now setup and you have the context of what you need to use it.  You are now ready to begin building applications.