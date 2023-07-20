#!/bin/bash

# This is the post-receive hook script

# Function to run after receiving new commits
post_receive() {
  echo "New commits were pushed to the repository!" >> /home/vagrant/aavamo-assignment/git/post-hook/hook.log
  # Add your custom script or commands here
  # For example, you can run a specific script:
  # /path/to/your/custom_script.sh
}

# Change to the repository's root directory
cd /home/vagrant/aavamo-assignment/git/post-hook

# Create the log file if it doesn't exist
touch /home/vagrant/aavamo-assignment/git/post-hook/hook.log

# Read input from standard input (piped from Git)
while read oldrev newrev refname; do
  # Check if the received data is related to a push to the master branch
  if [[ "$refname" == "refs/heads/master" ]]; then
    # Call the post_receive function after a successful push to the master branch
    post_receive
  fi
done

# Exit the script
exit 0

