# Fast navigation helpers
pj() {
  local base="$HOME/Projects"
  if [[ $# -eq 0 ]]; then
    cd "$base"
  else
    cd "$base/$1"
  fi
}

proxy_on() {
  export PROXY_HOST=127.0.0.1
  export PROXY_PORT=7890

  export HTTP_PROXY="http://$PROXY_HOST:$PROXY_PORT"
  export HTTPS_PROXY="$HTTP_PROXY"
  export ALL_PROXY="socks5://$PROXY_HOST:1080"

  export http_proxy=$HTTP_PROXY
  export https_proxy=$HTTPS_PROXY
  export all_proxy=$ALL_PROXY

  echo "🔌 Proxy ON ($PROXY_HOST:$PROXY_PORT)"
}

proxy_off() {
  unset HTTP_PROXY HTTPS_PROXY ALL_PROXY
  unset http_proxy https_proxy all_proxy
  echo "🔌 Proxy OFF"
}

proxy_status() {
  if [[ -n "${HTTP_PROXY:-}" || -n "${http_proxy:-}" || -n "${HTTPS_PROXY:-}" || -n "${https_proxy:-}" || -n "${ALL_PROXY:-}" || -n "${all_proxy:-}" ]]; then
    echo "🔌 Proxy ON"
    echo "HTTP_PROXY=${HTTP_PROXY:-$http_proxy}"
    echo "HTTPS_PROXY=${HTTPS_PROXY:-$https_proxy}"
    echo "ALL_PROXY=${ALL_PROXY:-$all_proxy}"
  else
    echo "🔌 Proxy OFF"
  fi
}
