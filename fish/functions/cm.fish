function cm --wraps='cmake --build build -t' --description 'alias cm=cmake --build build -t'
  cmake --build build -t $argv; 
end
