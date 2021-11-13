function z --wraps='tmux new-session -A -s main' --description 'alias z=tmux new-session -A -s main'
  tmux new-session -A -s main $argv; 
end
