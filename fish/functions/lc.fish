function lc --wraps='cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/home/austin/.local' --description 'alias lc=cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/home/austin/.local'
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/home/austin/.local $argv; 
end
