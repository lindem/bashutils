GIT="$(which git)"

# Creates a string in the form of [branchname dirtymark], where dirtymark is
# either a check mark (clean) or an x mark (dirty), if the function is called
# inside a git repository.

# the function is obviously meant to be used in a shell prompt configuration.
function gitprompt() {
  GITSTATUS="$($GIT status 2>/dev/null)"
  if [ -e $GITPATH ] && [[ ! -z $GITSTATUS ]]
    then
      GITBRANCH="$($GIT branch 2>/dev/null | grep '^*' | colrm 1 2)"
      if [[ ! -z "$(echo $GITSTATUS | grep 'working tree clean')" ]]
        then GITDIRTY=✔
        else GITDIRTY=✗
      fi
      echo "[$GITBRANCH $GITDIRTY]"
    else
      echo "$GITPATH $GITSTATUS"
  fi
}
