# sav_training
Savannah Software Engineering Meetup Group Training Project

Setup
=====
On a Windows box, there are several environment variables you will want to set up:

1. GITHUB -> Points at the directory where you keep your GitHub projects. This is so you can use other GitHub libraries that you create.

2. ISE_LIBRARY -> Points to the default location of the program files for your Eiffel Studio installation. On Windows, this is the C:\Projgram Files (x86) directory for Eiffel Studio.

3. ISE_EIFFEL -> Points to the same location as ISE_LIBRARY.

NOTE: #2/3 above ought to be set up automatically for you by Eiffel Studio when it loads (at least in Windows--Mac, I don't know). Otherwise, only GITHUB is something to ensure is set up properly.


To add the environment variables on a Mac (or most Linux distros), follow the steps below.

1.	From a terminal, type "ls -la" (without quotes) and press ENTER.

2.	In the list generated from step #1, verify that either the ".profile" or ".bash_profile" exists in your home directory.

3.	Type either "nano .profile" or "nano .bash_profile" (depending on which file exists in your home diretory).

4.	Add the following lines at the end of the file.

	a. export GITHUB="<path to your local GitHub repository's parent directory>"

	b. export ISE_LIBRARY="path to your Eiffel installation" (This is most likely in "/Applications/Macports/")

	c. export ISE_EIFFEL="path to your Eiffel installation" (This is most likely in "/Applications/Macports/")

5. Save the file by pressing Control+X then typing "y" and pressing ENTER when prompted to save the "Write Buffer"