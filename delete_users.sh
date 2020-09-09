UDEL=/usr/sbin/userdel

# Loop through usernames in file provided
while read USER; do

  # Delete the user
  $UDEL -r $USER

done <users.txt


