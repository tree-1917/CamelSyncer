# =========================================== #
# =============== CamelSyncer =============== # 
# =========================================== #
#!/usr/bin/env bash

set -euo pipefail 

VAULTNAME="CAMELSYNCER"
VAULTPATH="./$VAULTNAME"
IDE="$EDITOR" # global linux system variable to open default editor 
GUMFILER="gum file --padding '1' $VAULTPATH"

# === cleanup function === #
cleanup () {
  gum spin --title "Will Cleanup all temps" -- sleep 1 
  clear
}
trap cleanup EXIT 

# === create docfile function === #
create_docfile() {
  local docfile_name=$(gum input --placeholder="Enter Your Docfile Name?")
  if [[ -z "$docfile_name" ]]; then return; fi
  mkdir -p "$VAULTPATH/$docfile_name"
  $IDE "$VAULTPATH/$docfile_name/$docfile_name.md"
}

# === update docfile function === # 
update_docfile() {
  [[ ! -d "$VAULTPATH" || -z "$(ls -A "$VAULTPATH" 2>/dev/null)" ]] && { printf "Empty Vault\n"; sleep 1; return; }
  local docfile_path=$(eval "$GUMFILER")
  [[ -n "$docfile_path" ]]&& $IDE "$docfile_path"
}

# === delete docfile function === # 
delete_docfile() {
  [[ ! -d "$VAULTPATH" || -z "$(ls -A "$VAULTPATH" 2>/dev/null)" ]] && { printf "Empty Vault\n"; sleep 1; return; }
  local docfile_path=$(eval "$GUMFILER")

# Exit gracefully if the user presses Esc or cancels
  [[ -z "$docfile_path" ]] && return

  if [[ -f "$docfile_path" && "$docfile_path" == *"$VAULTNAME"* ]]; then
	gum confirm "Delete this file?" && {
	rm "$docfile_path"
	rmdir "$(dirname "$docfile_path")" 2>/dev/null
	gum toast --status success "Deleted successfully"
	}
  else
	  printf "Error: Invalid path or file not found."
	  sleep 3
  fi
}

# === list docfile function === #
list_docfiles() {
  [[ ! -d "$VAULTPATH" || -z "$(ls -A "$VAULTPATH" 2>/dev/null)" ]] && { printf "Empty Vault\n"; sleep 1; return; }
  local docfile_path=$(eval "$GUMFILER")
  [[ -n "$docfile_path" ]] && gum pager < "$docfile_path"
}

# === bulid articfate === # 
build_artifacte () {
  # need to tar.gz for vault dir 
  # need to encryption for this tar.gz with "gpg" key 
  printf "build articfate tar.gz file which password" 
}

# === sync github === # 
sync_github() {
  # need to sync and tar.gz.gpg file with private repo 
  # need to sync as one way sync
  printf "sync with github" 
}

# === main function  === # 
main ()
{
  clear
  [[ ! -d "$VAULTPATH" ]] && mkdir -p "$VAULTPATH"

  while true; do 
    clear 
    gum style \
      --foreground 212 --border-foreground 212 --border double \
      --align center --width 100 --margin "1 2" --padding "2 4" \
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

# =========================================== #
main                                          #
# =========================================== #
