function ic --wraps='cmake -S . -B build' --description 'alias ic=cmake -S . -B build'
  cmake -S . -B build $argv; 
end
