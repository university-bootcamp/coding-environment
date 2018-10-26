Windows
=======

Vagrant Install Fails
-------------


Installing Vagrant Fails and Gives Error Message:

```
Installation Directory must be on a local hard drive
```

**Force the installer to run with administrator privileges.
To do so:**

* Locate the `Vagrant_X.X.X.msi` installer file that you downloaded (X.X.X is the latest version number).
* While holding down the Shift key on the keyboard, right-click on the `Vagrant_X.X.X.msi`, then choose Copy As Path.
* Go to Start > All Programs > Accessories.
* Right-click on Command Prompt and choose Run As Administrator. This should open a command prompt window, labeled "Administrator:".
* In the Command Prompt window, type msiexec /i (you need to enter a single space after "/i").
* Right-click in the Command Prompt window, then choose Paste. This should paste the path to the MSI file that you copied in Step 2 above.
* Press Enter to run the command.
* Go through the MSI installer that launched, and since it's been launched as an Administrator problems should be resolved.
