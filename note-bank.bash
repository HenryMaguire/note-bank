# Program for Pomodoro timer
#!/bin/bash
#aplay /usr/share/sounds/alsa/Side_Right.wav
DIR="/home/henry/Work/phd-work/note-bank"
mkdir -p $DIR
file_path="$DIR/monomer_notes.txt"
# Change these to suit your needs (they are in minutes)
pom_number=$1; study_length=21; rest_length=4; summary_length=4; long_rest_length=20;
pom_length=$((study_length+rest_length+summary_length))
session_length=$((pom_number*pom_length))
#Here we will make sure the user is ready for this session. Log a time and date stamp.
timeEnd=$((`date +%s` + $((60*session_length)) ))
strEnd=`date --date @$timeEnd +%H:%M:%S`
echo -e "\nPress return when you are ready to start your set of $pom_number pomodoros.\nThis will take roughly $((session_length/60)) hours and $((session_length%60)) minutes - until $strEnd."
echo "This session will save to $file_path"
read ready
echo "`date +%Y-%m-%d` at `date +%H:%M:%S`" >> $file_path
echo -e "What would you like to achieve in these next $pom_number sessions?"
read begin_note
echo -e "Summarise your mood in one word:"
read mood_note
echo "Mood: $mood_note" >> $file_path
echo "Aim: $begin_note - `date +%H:%M:%S`" >> $file_path
for a in $(seq 1 $pom_number)
do
  now="`date +%H:%M:%S`"
  timeEnd=$((`date +%s`+$((study_length*60)))) 
  strEnd=`date --date @$timeEnd +%H:%M:%S`
  echo -e "It's $now. Get to work! You have $study_length minutes so finish at $strEnd."
  #osascript -e 'display notification "Get to work." with title "Go!" sound name "Submarine"'
  notify-send "Get to work. You have $study_length minutes."
  sleep $((study_length*60))
  notify-send "Stop working! Go and summarise in terminal."
  paplay /usr/share/sounds/freedesktop/stereo/complete.oga
  timeEnd=$((`date +%s`+$((summary_length*60)))) 
  strEnd=`date --date @$timeEnd +%H:%M:%S`
  echo -e "What did you get up to in Pomodoro $a? Include a plan of the next Pomodoro. You have until $strEnd."
  #osascript -e 'display notification "Go and summarise in terminal." with title "Stop!" sound name "Purr"'
  read note
  echo -e "Summary $a: $note `date +%H:%M:%S`" >> $file_path
  if [[ $a == "$pom_number" ]]; then
    paplay /usr/share/sounds/freedesktop/stereo/complete.oga
    # LAST ONE
    #osascript -e 'display notification "Get to work." with title "Go!" sound name "Submarine"'
    notify-send "Long break time!"
    timeEnd=$((`date +%s`+$((long_rest_length*60)))) 
    strEnd=`date --date @$timeEnd +%H:%M:%S`
    echo "Good job! Now take a longer rest. Come back at $strEnd."
    sleep $((long_rest_length*60))
    notify-send "Break is over. Begin next session in terminal."
    read fluff
  else
    timeEnd=$((`date +%s`+$((rest_length*60)))) 
    strEnd=`date --date @$timeEnd +%H:%M:%S`
    paplay /usr/share/sounds/freedesktop/stereo/complete.oga
    notify-send "Rest! Walk around for $rest_length minutes."
    echo "Good job! Now rest for $rest_length minutes. You have until $strEnd."
    #osascript -e 'display notification "Walk around for a few minutes." with title "Rest!" sound name "Hero"'
    sleep $((rest_length*60))
    paplay /usr/share/sounds/freedesktop/stereo/complete.oga
    notify-send "Break is over. Begin next session in terminal."
    echo "Your break is over, press enter to begin the next session:"
    #osascript -e 'display notification "Begin next session in terminal." with title "Break is over!" sound name "Purr"'
    read fluff
  fi
done
