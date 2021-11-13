function whatsmyip --wraps='curl ipinfo.io/ip' --description 'alias whatsmyip=curl ipinfo.io/ip'
  curl ipinfo.io/ip $argv; 
end
