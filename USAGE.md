# just-my-type-leaderboards<br />
Leaderboard backend written in Python using Flask<br />
<br />
Usage:<br />
1. Open up a UNIX-based command line terminal.<br />
If you do not have python2.7 do steps 2 and 3, if you have it then start on #4.
2. Go through process of having Python2.7, most Linux distros come with preinstalled.<br />
3. To install python: sudo add-apt-repository ppa:fkrull/deadsnakes-python2.7 <br />
sudo apt-get update 
sudo apt-get install python2.7
4. Navigate to the directory of the download leaderboards files, to download you can do: 
git clone "https://github.com/andrewberg/just-my-type"
5a. Do: sudo ./setupflask.sh; if first time running, if run before you can do ./runserver.sh
If you get an error do: chmod u+x ./setupflash.sh and chmod u+x ./runserver.sh
5. Do: sudo pip install --upgrade pip setuptools<br />
6. Do: sudo pip install virtualenv<br />
7. Do: virtualenv flask
Creates a flask virtual environment
8. Do: source ./flask/bin/activate
This opens the virtual environment
9. Do: pip install flask
This will install flask framework
10. Do: python createdb.py<br />
11. Do: python leaderboards.py<br />
12. You should receive this: <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Restarting with stat<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Debugger is active!<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Debugger pin code: 333-045-521<br />
13. You will now be able to locally access the server API by IP, 127.0.0.1:5000.<br />
    Example: 127.0.0.1:5000/jmt/typingtest/list will list the leaderboards for the TypingTest.<br />
14. In the JustMyType project, change the IPs in the LeaderboardHelper.swift to http://127.0.0.1:5000<br />
  instead of http://bergcode.com if you want to run the system on your local machine.<br />
15. You can use deactivate to get out of the virtualenv flask
16. To run again you can always do ./runserver.sh for a shortcut. 
