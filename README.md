# Overview
This is a small command line-based productivity app, based on the [Pomodoro technique](https://en.wikipedia.org/wiki/Pomodoro_Technique). The user-interface is not much to look at but it has been very helpful to me.

You start out by writing down what you aim to achieve over the next 5 sessions. Then a timer is set and and you get to work. When the timer finishes a box pops up which prompts you to write a brief summary (in Terminal) of what you did in the last session. The entry is saved in a text file along with the time and date. You then have a short break. Rinse and repeat.

Enjoy.

# System requirements
As of yet, this will only work in OSX because it relies on *osascript*. I'm working on making it compatible with all platforms! Apart from that you shouldn't need anything else installed.

# Getting started
1. Open up `note-bank.bash` in your favourite text editor.
2. Change the variable `DIR` to the working directory you would like to save your notes to. Also change the `study_length`, `rest_length` and `summary_length` variables to suit your needs (I like plenty of time to summarise).
3. In `file_path` change `notes.txt` to whatever you want your notes file to be called.
4. Run the app in terminal by entering `bash note-bank.bash` (make sure you're in the application directory).
5. Follow all of the directions in terminal

# New features
- Users can input their own working directory, so the notes are saved elsewhere on the computer (rather than just next to the .bash file). This means users can easily work on different threads/projects by just changing the file_path variable.

# Bugs
- When you click on the current pop-ups it takes you to a weird apple script editor environment which I neither like nor understand.

# Future features
- Rather than taking you to the apple script editor page I would like the pop-ups to take you to the terminal (or the future writing environment).
- Compatibility with linux and Windows. Perhaps would need to rewrite everything in Python and use some of the available resources.
- Turn the pop-ups/alerts into the writing field for the summaries. I think I can use tkinter for this.
