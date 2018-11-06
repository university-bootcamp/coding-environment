# Setting up a Cloud9 Development Environment

Cloud9 is a cloud-based development IDE brought to you by Amazon web services (AWS).  You can use your AWS account to create this web based IDE.

## Step 1 — Log into your AWS Account.

Sign in to your [AWS account](https://aws.amazon.com/) and visit the [AWS Management Console](https://console.aws.amazon.com/).

## Step 2 — Create a new Cloud9 Environment

**First**, in the AWS management console, scroll down and find the option for **Cloud9**, listed under **Developer Tools**.  Click this link.

![cloud9](images/0-choose-cloud9.png)

**Second**, in the page that opens, click the orange button that suggest **Create Environment**.

![cloud9](images/1-create-environment.png)

**Third**, in the options that are shown enter a name.

| field | value |
|---|---|
| Name | coding-environment |

Then click the orange **Next step** button.

![cloud9](images/2-env-setup.png)

**Fourth**, leave the default fields selected and click the orange **Next step** button.

![cloud9](images/3-create.png)

**Fifth**, Amazon will show you the prompts of what is being created for you to confirm that it works.  Scroll to the bottom and click the orange **Create environment** button.

![confirm](images/4-create-again.png)

**Sixth**, wait for your environment to finish being created.  You will be prompted to wait for the process to finish.

![wait](images/5-wait.png)

When the page finishes loading it will take you to your Cloud9 IDE.  Now that your environment is created you will be able to configure your coding environment.



#### BLOG POST REWRITE



Cloud9 Coding Environment

The terminal section at the bottom is a bit special. It allows us to run programs directly by running commands. The terminal window can also output text. For example, if you click on the blue box at the bottom and type “date” and press enter, your environment will tell you the current date.

Cloud9 Terminal

Cool! We’re set up and all our programs are installed!

Connecting our accounts (GitHub and Heroku)
Remember how we had you create a couple of accounts earlier? Now we need to make it so our coding environment is able to access our accounts on these sites. Don’t worry too much about what this is doing right now, but make sure these steps run without any error messages.

Connect Heroku

Our coding environment has a program to allow us to connect to heroku, but by default it’s a little out of date. To update this, run the following command in the terminal window:

wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh

Next, we will need to log into our heroku account in this coding environment. This will prompt you for your Heroku email and password. Run the following command to start to initiate the login process, then enter your email and password when you’re prompted for it.

heroku login

Then run:

heroku keys:add

Cool. Heroku is connected.

Connect GitHub

Connecting GitHub is a little trickier than Heroku. To start, we need to be able to access our SSH key, which is basically a password file. Run this command to display the SSH key to the terminal window.

cat ~/.ssh/id_rsa.pub

Copy the entire output (starts with “ssh-rsa” and ends with your email address) to your clipboard. For me on my environment, it looks like:

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5AAIZsdUmNnY6AgJzgCT8…
omglolhahaha@thefirehoseproject.com

We need to tell GitHub this is what our password file looks like. To do so, log in to GitHub and follow GitHub’s instructions (note: we don’t need to use pbcopy like GitHub tells us to because we manually copied the password file to our clipboard in the previous step).

SSH Key

The last step for setting up git and GitHub is to tell git what our name and email address are. Run these commands, but make sure to provide your real name and email address inside the double quotes instead of the dummy data that we have here:

git config --global user.email "you@example.com"

And then run:

git config --global user.name "Your Name"

Set up the Postgres database
If you’re learning how to build web applications, the most common way to get it “live on the internet”— for example, to get a link so you can share it with other people— is to do it through heroku.com. Most likely, you’ll be using Heroku for your first apps, too.

Heroku uses a database called “postgres.” Because of this, getting Postgres installed and running in our environment is a good idea.

Running the same database as Heroku in our coding environment is generally considered a good idea. Many tutorials will have you use a different database when you’re coding on your own machine versus when it’s live on the internet. This is generally because it’s a bit easier to set up, but it’s a bad idea in the long run.

Using the same database across both generally makes it easier to do and this is called parity with a dev environment. Developers generally agree that it’s a good thing. Even though it can be kind of a pain now, let’s be responsible and set up Postgres to save us pain in the future.

Start the server up by running this command:

sudo service postgresql start

Sadly, our Postgres database is configured in a weird way.

Here are a bunch of black-magic commands that are super confusing. Don’t worry about the details of what they’re actually doing.

Run this command to jump into the back end of your database to run the commands:

sudo sudo -u postgres psql

Then, copy and paste this super bizarre stuff. Basically in a nutshell, this sets up our database and the password, and makes it so it’s storing data in the database in unicode, which is the most flexible character encoding, which Ruby on Rails will need it to be. Confused by this? That’s okay. Just copy this, and paste it in the terminal.

ALTER USER postgres WITH PASSWORD 'password';
UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';
DROP DATABASE template1;
CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UNICODE';
UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';
\c template1
VACUUM FREEZE;

Then press CTRL+D.

Awesome! We just set up our Postgres database.

Create a new rails application
First, we’ll need to install the ruby on rails gem.  Do that, by running this command:

gem install rails -v 5.0.1
Let’s test things out by creating a new rails application. To do so, run this command:

rails new myapp -d postgresql

This builds a ton of files and gives us what is like a “blank” rails app. This means we won’t have to start fresh with a blank slate. Instead, we can start with the standard starting files that this generates.

The rails new indicates we’re building a new rails app. myapp is the name of the app, and -d postgresql sets the app up to connect to the Postgres database we built earlier.

Then, so you’re running commands on the app you just built, run this command:

cd myapp

Open up the file named config/database.yml. This file tells our web application how we can talk to the database. You’ll need to make a couple quick adjustments to the file. Add these three lines of code to the file:

https://gist.github.com/kenmazaika/077bb791e6218d566fdb#file-database-yml-L22-L24

Then save the file. Be careful about indentation here. Each line needs to be indented exactly the same number of spaces as the line above it.

Create the database
Run this command to create the database:

rake db:create

The moment of truth: running the app
Finally, we are ready to start our application. In Cloud9, the following command allows us to start our web application:

rails s -b $IP -p $PORT

The terminal window where you just ran the rails server command will look like it runs for forever. That’s a good thing, since we want our server to be running all the time so we can see our web application in our browser all the time.

One thing you’ll notice is that the rails server command basically eats our dollar sign, so we can no longer run commands or do anything with this “web dev” terminal window.

Open a new terminal tab
Since we can’t use our original terminal window anymore, let’s always make sure to have a second, separate terminal window open. Press the plus button to create a new terminal window. You’ll want to have two terminal windows: one for the server, and one for running commands.

New Cloud9 Terminal Tab

Then, in the new terminal tab that opened up, we can go to our application by running this command:

cd myapp

Preview your application
In the menu, click “Preview” in the top right to see your app running:

Preview App

Or, go to:

https://your-workspace-name.c9users.io/

And make sure to replace your-workspace-name, with your project’s real workspace name.

And then you’ll see your app running:

Running App in Cloud9

Things that are important to know about your environment.
That setup will work for you regardless of your computer setup. There are a couple of small adjustments you’ll need to make in the process of building the applications that the most tutorials will suggest. Here’s what you need to know:

If you use this setup you will use Cloud9’s IDE setup instead of a native text editor on your computer like sublime text.
If instructions ever tell you to run a command that starts with rails server, you’ll always need to run the command: rails s -b $IP -p $PORT, instead.
Instead of visiting your app using localhost, you will use the trick this article suggests to preview your app.
Everytime you open Cloud9, you will need to start the postgres server with: sudo service postgresql start
After using Cloud9 for a long period of time, you may run out of disk space, and it may prompt you to upgrade. You will not need to upgrade. To reclaim the disk space, run the following command:
sudo rm -rf /home/ubuntu/.local/share/heroku/tmp

Overall, Cloud9 is a really great development environment, and in a lot of cases using that is a lot smoother than working with other alternative installation setups.






$$$ NOTES








http://blog.thefirehoseproject.com/posts/setting-up-a-cloud9-development-environment/

npm install -g heroku

sudo yum install postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs

CLICK Y


https://medium.com/@floodfx/setting-up-postgres-on-cloud9-ide-720e5b879154

Need to click the extender button to preview in browser.  Local Cloud9 browser env doesn't work
