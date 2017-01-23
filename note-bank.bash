# Program for Pomodoro timer
#!/bin/bash
DIR="/Users/henrymaguire/Work/phd-work/note-bank"
mkdir -p $DIR
file_path="$DIR/notes.txt"
echo "`date +%Y-%m-%d`" >> $file_path
echo -e "What would you like to achieve in these next five sessions?"
read begin_note
echo -e "Summarise your mood in one word:"
read mood_note
echo "`date +%H:%M:%S`" >> $file_path
echo "Mood: $mood_note" >> $file_path
echo "$begin_note" >> $file_path
for a in 1 2 3 4
do
  echo -e "It's `date +%H:%M:%S`. Get to work!"
  osascript -e 'display notification "Work for 18 minutes." with title "Go!" sound name "Submarine"'
  sleep 1080
  #sleep 480
  echo -e "What did you get up to in Pomodoro $a? Include a plan of the next Pomodoro."
  osascript -e 'display notification "You have 2 minutes to summarise in terminal." with title "Stop!" sound name "Purr"'
  read note
  echo "`date +%H:%M:%S`" >> $file_path
  echo "$note" >> $file_path
  echo >> $file_path
  echo "Good job! Now rest for 5 minutes."
  osascript -e 'display notification "Walk around for 5 minutes." with title "Rest!" sound name "Hero"'
  sleep 300
  echo "Your break is over, press enter to begin the next session:"
  osascript -e 'display notification "Begin next session in terminal." with title "Break is over!" sound name "Purr"'
  read fluff
done

osascript -e 'display notification "Work for 18 minutes." with title "Go!" sound name "Submarine"'
sleep 1080
osascript -e 'display notification "Summarise last session in terminal." with title "Stop!" sound name "Purr"'
echo -e "What did you get up to in Pomodoro 5?"
read final_note
echo "`date +%H:%M:%S`" >> $file_path
echo "$final_note" >> $file_path
echo >> $file_path
osascript -e 'display notification "Take a long break." with title "Rest!" sound name "Ping"'
echo "Good job! Now take a long rest."
