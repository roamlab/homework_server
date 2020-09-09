#!/bin/bash
UADD=/usr/sbin/useradd

# Loop through usernames in file provided
while read USER; do

  # Read password for user
  read PASS

  # Make the password usable for the useradd utility
  PASS=`mkpasswd $PASS`

  # Create the user
  $UADD -m $USER -p $PASS

  # Skip empty line
  read EMPTY

done <passwords.txt
