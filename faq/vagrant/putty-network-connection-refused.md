# PuTTY show the error message `Network Connection Refused`

PuTTY can show an error message that indicates that the PuTTY connection was refused.  This happens frequently when going through the install process.

This problem happens quite often to people while going through the install process.  If this happens, do the following three steps:

**First**, make sure the steps in [Step #3: Starting Your Virtual Machine](https://github.com/university-bootcamp/coding-environment/blob/master/windows-vagrant.md#step-3-starting-your-virtual-machine) completed successfully without any error messages.

**Second**, as you run that command you may be presented a pop-up that asks you if you want to a connection to be opened in your Firewall. 

If it presents you with this question, click _yes_"_ or _allow_.

**Third**, once that `vagrant up` command runs to completion and the window is ready to get text input again - it takes a while to finish it means that the command worked. 

After trying this again [Step #4: Log into your dev environment](https://github.com/university-bootcamp/coding-environment/blob/master/windows-vagrant.md#step-4-log-into-your-dev-environment)
 should allow you to connect.  If you are able to connect to your PuTTY environment and no longer see the `Network Connection Refused` error the command completed.
 
-----

Running through these steps usually will fix Windows machines that show the `Network Connection Refused` error - and if it did, you can continue to the next steps.  

If, however, you continue to see problems with your environment, it is in a state that is slightly different than these instructions expect. Because of this, you should ask for help for a TA.

To get the best answer, use the following template to ask for help.

> Hello. I'm setting up my web development environment using vagrant and when running the vagrant up command I encountered an unusual problem. Attached is a screenshot of the error.

Then take a screenshot of the full output of the `vagrant up` command that ran successfully, take a screenshot of the filled out PuTTY Configuration right before you press the _Open_ button,  and also the `Connection Refused` error you're seeing.

If you're making any mistakes in this process your TA will help you, or they will help guide you to how you can use a CloudIDE.