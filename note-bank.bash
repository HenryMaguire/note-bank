# Program for Pomodoro timer
#!/bin/bash
echo "`date +%Y-%m-%d`" >> notes.txt
echo -e "What would you like to achieve in these next five sessions?"
read begin_note
echo -e "Summarise your mood in one word:"
read mood_note
echo "`date +%H:%M:%S`" >> notes.txt
echo "Mood: $mood_note" >> notes.txt
echo "$begin_note" >> notes.txt
for a in 1 2 3 4
do
  echo -e "It's `date +%H:%M:%S`. Get to work!"
  osascript -e 'display notification "Work for 18 minutes." with title "Go!" sound name "Submarine"'
  sleep 1080
  #sleep 480
  echo -e "What did you get up to in Pomodoro $a?"
  osascript -e 'display notification "You have 2 minutes to summarise in terminal." with title "Stop!" sound name "Purr"'
  read note
  echo "`date +%H:%M:%S`" >> notes.txt
  echo "$note" >> notes.txt
  echo >> notes.txt
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
echo "`date +%H:%M:%S`" >> notes.txt
echo "$final_note" >> notes.txt
echo >> notes.txt
osascript -e 'display notification "Take a long break." with title "Rest!" sound name "Ping"'
echo "Good job! Now take a long rest."
