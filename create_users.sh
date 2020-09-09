#!/bin/bash
UADD=/usr/sbin/useradd
OPENSSL=/usr/bin/openssl

# Loop through usernames in file provided
while read USER; do

  # Generate 12 characters long password and print it.
  PASS=`$OPENSSL rand -base64 6`

  # Write username/ password combination to file
  echo $USER >> passwords.txt
  echo $PASS >> passwords.txt
  echo '' >> passwords.txt

  # Make the password usable for the useradd utility
  PASS=`mkpasswd $PASS`

  # Create the user
  $UADD -m $USER -p $PASS

  # Create SVN repo for assignments
  svnadmin create /home/$USER/assignments
  chown -R $USER /home/$USER/assignments

  # Give group ownership to graders
  chgrp -R graders /home/$USER

done < users.txt
