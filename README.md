# just-my-type

a) How to compile:

    This is an iOS built using Xcode. In order to compile it, the latest version of Xcode must be 
    installed. Download all of the files, launch the program using "JustMyType.xcodeproj" and press 
    the play button in the upper left corner to compile.

b) How to run the code:

    Make sure to select the simulator that you want to use (for example iPhone 6s simulator) or 
    connect apple device to computer before compiling. Then wait for the simulator or device to 
    load the project and automatically start the program.

c) How to run the unit test cases:

    In order to run the unit test cases you can compile the program as you would normally in Xcode and the
    test will run along with the program.

d) Acceptance tests for an external person to try:

    i) Navigate through various menus by clicking buttons and seeing the correct new menu or 
    screen appear.
    ii) Type the correct word into the typing test and see that a new word automatically pops 
    up once this has been accomplished
    iii) Type an incorrect word into the typing test and see that it does not let you continue 
    onto a new word
    iv) Check to make sure you can reset your score to try again and make sure your high score
    doesn't disapear on exit of the app.


#Change Log

Version 0.1.0

Updates of previous versions:
Changes to the layout of the typing test, the format for the main menu and added more mores to the dictionary.
Multiplayer is no longer available as an option on the main menu. To implement it required having developer access to the App Store.
TypingTest now has the option to pick from a random set of works or an exerpt from Shakespeare.

New to Version 0.1.0

Sound effects and music have been added to the app. These can be disabled in the settings menu. Not sure if they are different options or not though.

Three - Four games added:
    Basketball
    Racing
    Balloons
    
    
Basketball - Type the word to make the shot. If you miss, you dont get the points. The last few seconds give addtional points.

Racing - A three-way race between 2 AI. You have to type the words as fast as you can. There is no time limit, but the goal is to win.

Balloons - Words don't have to be typed in sequence. Pop as many balloons as you can in the time limit.

The games are basically, functionally, the same. However, the goal for them is to make your words per minute higher.

Leaderboards have also been added. The leaderboards store local high scores and high scores of the other users of the app. 




Version 0.0.3

Basic Interface is still the same
    The Single and Multi- player menus now have options in them. The options do not do anything currently.
   
Changed the dictionary for random words from a small array in a file to an external file to read from.
Added a failed word animation.
Added a scoreboard.
Added the ability to calculate WPM.


Version 0.0.1

Basic interface created. 
Basic Typing Test created.
Small word list for testing only.
