#!/usr/bin/env bash


VIRTUALENV="$HOME/.virtualenvs/nodeenv"

source "$VIRTUALENV/bin/activate"
nodeenv "$@"
deactivate
