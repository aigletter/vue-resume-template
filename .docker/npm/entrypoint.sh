#!/bin/sh

echo "APP_ENV: $APP_ENV"

if [ -n "$1" ]; then
  cmd=$1
    shift
else
  cmd="npm"
fi

if [ "$cmd" = "npm" ]; then
  if [ -n "$1" ]; then
    npmCommand=$1
    shift
  else
    npmCommand="run"
  fi

  args="$npmCommand"

  if [ "$npmCommand" = "run" ]; then
    if [ -n "$1" ]; then
      npmRunCommand=$1
      shift
    else
      if [ "$APP_ENV" = "dev" ]; then
        npmRunCommand="dev"
      else
        npmRunCommand="build"
      fi
    fi
    args="$args $npmRunCommand"
  fi
fi

echo "CMD: $cmd $args $@"

exec $cmd $args "$@"