function trySetEditor {
  local desiredEditor=$1
  editorLocation=$(command -v ${desiredEditor} 2>/dev/null)
  if [[ -z "$editorLocation" ]]; then
    #echo "Editor Location NOT found for: $desiredEditor"
    return 1
  else
    #echo "Editor Location found: $editorLocation"
    export EDITOR=$editorLocation
    export VISUAL=$editorLocation
  fi

  return 0
}

trySetEditor 'nvim' || trySetEditor 'vim' || trySetEditor 'vi' || trySetEditor 'nano'

