# Connecting Accounts to your Environment

For your GitHub.com and heroku.com accounts to work correctly, you will need to connect your coding environment with these accounts. This guide walks through that process.

1. [Generate SSH Key](#step-1-generate-ssh-key)
2. [Configure Heroku with SSH key](#step-2-configure-heroku-with-ssh-key)
3. [Configure GitHub with SSH key](#step-3-configure-github-with-ssh-key)
   - [Configure the git program](#configure-the-git-program)

## Step 1: Generate SSH Key

An `SSH key` is a password file that exists on your computer.  First, we will need to generate a password file for our environment to use and we will do that in this section.  In the next part, we'll use this password file with our accounts.

> **Note:** The command that we are suggesting to run includes the backtick character, ```.  This is a different character than the single quote character, `'`.
> 
> Either copy and paste the command below, or if you type it use the correct backtick character.  Usually, you can find this character on your keyboard on the key to the left of the 1 button.

This first command will run the command to turn on the SSH program in your environment.

*First*, run the following command in your coding environment's terminal prompt.

```
eval `ssh-agent -s`
```

After the SSH agent begins running, run the following command to generate an SSH key (a password file) inside your coding environment.

**Next**, copy and paste the following command into your coding environment's terminal prompt.


```
ssh-keygen -t rsa -C "Bootcamp" -N '' -f ~/.ssh/id_rsa
```

This file that was created needs to be registered on your computer.

**Finally**, copy and paste the following command into your coding environment's terminal prompt.

```
ssh-add ~/.ssh/id_rsa
```

This is everything you need to do to generate new SSH keys and have them setup in your coding environment.  Now we can use these SSH keys with the accounts you created.

## Step 2: Configure Heroku with SSH key

Your environment will need a heroku command line tool, the heroku `cli`, which will need to be installed.

**First**, copy and paste the following command to install this program into your coding environment.

```
wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh
```

Next, we will need to log into our heroku account in this coding environment.

> The next command will prompt you for the email address and password that you used when setting up your heroku account.

**Next**, run the following command and enter your email address and heroku password when prompted for it.

```
heroku login -i
```

This step logs your computer into your heroku account.  Connecting your heroku account with your SSH keys will make it so you won't have to manually log into heroku in the future when using it.

**Finally**, add your ssh key to your heroku account by running the following command in your coding environment.

```
heroku keys:add
```

Enter `Yes` when prompted to upload to Heroku. This step will finalize the connection between your coding environment and the heroku service.

## Step 3: Configure GitHub with SSH key

Your environment will need to connect it's SSH key to the GitHub service, too.  We have written a script to help with this process.

> The command below will execute a script that we've written to automatically connect your GitHub account wit your SSH key.  
> 
> In this process, the program will prompt you for your GitHub username.  Keep in mind, this is your `username` for GitHub.com not your email address.

**Next**, copy and paste the following command in your coding environment.  After running this command, enter your GitHub username and password to connect your account.

```
curl https://raw.githubusercontent.com/university-bootcamp/coding-environment/master/github_auth.rb > ~/.bootcamp-github.rb && ruby ~/.bootcamp-github.rb
```

> **Important**:  After running the above command the command should display the text `ok!` in the terminal window.
>
> If it gives an error message, this usually indicates that you had problems when entering your username or password.  If this happens, try the above command again and enter your credentials another time.
>
> If you have two-factor authentication enabled, the above script won't work. Either disable 2FA, or follow the steps here <https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/>

#### Configure the git program

The above steps set git and GitHub to use your SSH key as a way to connect to your account.  There are also two configuration options you will need to provide git.

**Enter the following command in your web development environment**, and also be sure to adjust the email address in the command you execute to be your actual email address instead of the `you@example.com` address.

```
git config --global user.email "you@example.com"
```

**Enter the following command in your web development environment**, and also be sure to adjust the email address in the command you execute to be your name instead of the `Your Name` value.

```
git config --global user.name "Your Name"
```

After running these steps without error messages git will be setup and configured as expected in your coding environment.
