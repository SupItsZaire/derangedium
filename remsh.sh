#!/usr/bin/env sh

iex --erl "-pa epmd_docker/ebin -epmd_module epmd_docker -setcookie derangedium -sname shell" --remsh derangedium@$1
