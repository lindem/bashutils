GIT="$(which git)"

ANSI_RESET=$(ansiseq 0)
ANSI_YELLOW=$(ansiseq 33)
ANSI_RED=$(ansiseq 31)
ANSI_LGREEN=$(ansiseq 92)

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
        then GITDIRTY="\001${ANSI_LGREEN}\002✔"
        else GITDIRTY="\001${ANSI_RED}\002✗"
      fi
      # important: the trailing space.
      echo -e "[\001${ANSI_YELLOW}\002${GITBRANCH} ${GITDIRTY}\001${ANSI_RESET}\002] "
    else
      echo ""
  fi
}
