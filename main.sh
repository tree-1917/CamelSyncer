#!/usr/bin/env bash

set -euo pipefail 

VAULTNAME="CAMELSYNCER"
VAULTPATH="./$VAULTNAME"
IDE="$EDITOR" # global linux system variable to open default editor 

# == cleanup function 
cleanup () {
  gum spin --title "Will Cleanup all temps" -- sleep 1 
  clear
}
trap cleanup EXIT 

# == create docfile function 
create_docfile() {
  local docfile_name=$(gum input --placeholder="Enter Your Docfile Name?")

  # Ensure that the user did not click Esc or leave the name blank
  if [[ -z "$docfile_name" ]]; then return; fi

  mkdir -p "$VAULTPATH/$docfile_name"
  $IDE "$VAULTPATH/$docfile_name/$docfile_name.md"
}

# == update docfile function 
update_docfile() {
  [[ ! -d "$VAULTPATH" || -z "$(ls -A "$VAULTPATH" 2>/dev/null)" ]] && { printf "Empty Vault\n"; sleep 1; return; }
  local docfile_path=$(gum file "$VAULTPATH")
  [[ -n "$docfile_path" ]]&& $IDE "$docfile_path"
}

# == delete docfile function
delete_docfile() {
  [[ ! -d "$VAULTPATH" || -z "$(ls -A "$VAULTPATH" 2>/dev/null)" ]] && { printf "Empty Vault\n"; sleep 1; return; }

  local docfile_path=$(gum file "$VAULTPATH")
  docfile_name=$(basename $docfile_path) 

   gum confirm "Are you sure you want to delete this doc?" && rm -rf $VAULTPATH/$docfile_name 
}

# == list docfile function 
list_docfiles() {
  [[ ! -d "$VAULTPATH" || -z "$(ls -A "$VAULTPATH" 2>/dev/null)" ]] && { printf "Empty Vault\n"; sleep 1; return; }

  local docfile_path=$(gum file "$VAULTPATH")

  [[ -n "$docfile_path" ]] && gum pager < "$docfile_path"
}
# == update 
# == main function 
main ()
{
  clear
  [[ ! -d "$VAULTPATH" ]] && mkdir -p "$VAULTPATH"


  while true; do 
    clear 
    gum style \
      --foreground 212 --border-foreground 212 --border double \
      --align center --width 50 --margin "1 2" --padding "2 4" \
      "$VAULTNAME" "Manager for your docfile file for project with you everywhere until servers"

    option=$(gum choose "create docfile" "update docfile" "delete docfile" "list docfiles" "exit") 
    
    case $option in 
      "create docfile" ) create_docfile ;;
      "update docfile" ) update_docfile ;; 
      "delete docfile" ) delete_docfile ;; 
      "list docfiles"  ) list_docfiles ;; 
      "exit") exit 0 ;;
    esac
  done
}


main
