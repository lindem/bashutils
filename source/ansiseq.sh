# Echoes ANSI color codes for fanciful prompts

function ansiseq() {
  if [ ! -z $1 ]
  then
    echo -e "\e[${1}m"
  else
    echo ""
  fi
}
