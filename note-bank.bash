# Program for Pomodoro timer
#!/bin/bash
DIR="/Users/henrymaguire/Work/phd-work/note-bank"
mkdir -p $DIR
file_path="$DIR/notes.txt"
# Change these to suit your needs (they are in minutes)
pom_number=5; study_length=20; rest_length=5; summary_length=5
pom_length=$((study_length+rest_length+summary_length))
session_length=$((pom_number*pom_length))
#Here we will make sure the user is ready for this session. Log a time and date stamp.
echo -e "\nPress return when you are ready to start your set of $pom_number pomodoros.\nThis will take roughly $((session_length/60)) hours and $((session_length%60)) minutes."
read ready
echo "`date +%Y-%m-%d`" >> $file_path; echo "`date +%H:%M:%S`" >> $file_path
echo -e "What would you like to achieve in these next five sessions?"
read begin_note
echo -e "Summarise your mood in one word:"
read mood_note
echo "Mood: $mood_note" >> $file_path
echo "$begin_note" >> $file_path
END=$((pom_number-1)) # Final pomodoro ends with a different message so we keep that one out of the loop
for a in $(seq 1 $END)
do
  echo -e "It's `date +%H:%M:%S`. Get to work! You have $study_length minutes."
  echo "`date +%H:%M:%S`" >> $file_path
  osascript -e 'display notification "Get to work." with title "Go!" sound name "Submarine"'
  sleep $((study_length*60))
  echo -e "What did you get up to in Pomodoro $a? Include a plan of the next Pomodoro."
  osascript -e 'display notification "Go and summarise in terminal." with title "Stop!" sound name "Purr"'
  read note
  echo -e "$note \n`date +%H:%M:%S`" >> $file_path
  echo "Good job! Now rest for $rest_length minutes."
  osascript -e 'display notification "Walk around for a few minutes." with title "Rest!" sound name "Hero"'
  sleep $((rest_length*60))
  echo "Your break is over, press enter to begin the next session:"
  osascript -e 'display notification "Begin next session in terminal." with title "Break is over!" sound name "Purr"'
  read fluff
done
echo -e "It's `date +%H:%M:%S`. Get to work!"
echo "`date +%H:%M:%S`" >> $file_path
osascript -e 'display notification "Get to work." with title "Go!" sound name "Submarine"'
sleep $((study_length*60))
osascript -e 'display notification "Summarise last session in terminal." with title "Stop!" sound name "Purr"'
echo -e "What did you get up to in Pomodoro 5?"
read final_note
echo "$final_note" >> $file_path
echo "`date +%H:%M:%S`" >> $file_path
osascript -e 'display notification "Take a longer break." with title "Rest!" sound name "Ping"'
echo "Good job! Now take a longer rest. Come back in about 20 minutes."
