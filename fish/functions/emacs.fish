function emacsg
   emacsclient --c $argv &disown
end

function emacs
  emacsclient --c -nw $argv
end
