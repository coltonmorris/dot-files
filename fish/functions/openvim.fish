function __options
  echo $argv | sed 's|--*|\\'\n'|g' | grep -v '^$'
end

function openvim -d "vim wrapper for opening files neatly"
  set -l count (count $argv)
  set -l command ""
  set -l window 1
  set -l files 
  set -l commandFlag false
  set -l windowFlag false
  set -l servername OPENVIM
  set -l fileCount
  set -l numberOfTabs
  set -l filesPerTab

  if test "$count" -eq 0
    return
  end

  for i in (seq $count)
    switch "$argv[$i]"
      case -h --help
        echo "This is a vim wrapper made that opens multiple vim files neatly into windows and tabs"
        echo ""
        echo "Use: -w, --window  to specify how many windows per tab"
        echo "Use: -c, --command to specify a command to run in each window on startup"
        echo 'Example use case:'
        echo -e '\topenvim -w 3 -c "/port" (git grep -l "port")'
        return
      case -w --window
        set window $argv[(math $i+1)]
        set windowFlag true
      case -c --command
        set command $argv[(math $i+1)]
        set commandFlag true
      case \*
        if test "$commandFlag" = false
          if test "$windowFlag" = false
            set files "$files $argv[$i]"
          end
        end

        set commandFlag false
        set windowFlag false
    end
  end
  
  gvim --servername $servername
  #sleep to let gvim load
  sleep 2
  
  set files (echo $files | cut -c 2- | tr ' ' \n)
  set fileCount (count $files)
  set numberOfTabs (math "$fileCount/$window")


  echo "fileCount: " $fileCount

  for i in (seq $fileCount)
    set -l first (math "$i % $window")
  
    if test $first -eq 1
      gvim --servername $servername --remote-send "<Esc>:e $files[$i]<CR>"
      gvim --servername $servername --remote-send "<Esc>:$command<CR>"
    else if test $first -eq 0
      #it's the last file in the tab
      gvim --servername $servername --remote-send "<Esc>:vsp $files[$i]<CR>"
      gvim --servername $servername --remote-send "<Esc>:$command<CR>"
      gvim --servername $servername --remote-send "<Esc>:tabnew<CR>"
    else
      gvim --servername $servername --remote-send "<Esc>:vsp $files[$i]<CR>"
      gvim --servername $servername --remote-send "<Esc>:$command<CR>"
    end
  end
  gvim --servername $servername --remote-send "<Esc>:q<CR>"
end
