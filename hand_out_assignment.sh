#!/bin/bash

# Loop through usernames in file provided
while read USER; do

  # Copy assignment into home directory
  #svn delete file:///home/$USER/assignments/assignment0 -m "deleting for update"
  svn import /home/mkh2149/4602_mooc1/assignments/assignment$1/student_code file:///home/$USER/assignments/ -m "Initial import"

  # Check out code to fix executability
  mkdir temp
  cd temp
  svn co file:///home/$USER/assignments/state_estimator
  cd state_estimator
  svn propset svn:executable ON scripts/*
  svn ci -m "Made executable"
  cd
  rm -rf temp

  # Give ownership to user
  chown -R $USER /home/$USER/assignments

  # Give graders group ownership
  chgrp -R graders /home/$USER/assignments

done <users.txt
