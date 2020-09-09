#!/bin/bash

# Loop through usernames in file provided
while read USER; do

  # Check out code to update
  mkdir temp
  cd temp
  svn co file:///home/$USER/assignments/state_estimator
  cp ../4602_mooc1/assignments/assignment5/student_code/state_estimator/grade_assignment5.sh state_estimator/grade_assignment5.sh
  cp ../4602_mooc1/assignments/assignment5/student_code/state_estimator/scripts/gui_plugin.py state_estimator/scripts/gui_plugin.py
  cp ../4602_mooc1/assignments/assignment5/student_code/state_estimator/scripts/robot.py state_estimator/scripts/robot.py
  svn propset svn:executable ON state_estimator/scripts/*
  cd state_estimator
  svn ci -m "Updated robot"
  cd
  rm -rf temp

  # Give ownership to user
  chown -R $USER /home/$USER/assignments

  # Give graders group ownership
  chgrp -R graders /home/$USER/assignments

done <users.txt
