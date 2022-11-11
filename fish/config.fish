if status is-interactive
    # Commands to run in interactive sessions can go here
    direnv hook fish | source
    source ~/.config/fish/functions/emacs.fish
end
