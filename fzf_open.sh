#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 <editor>"
    exit 1
fi

EDITOR="$1"

FILE=$(find . -type f | fzf)

if [ -z "$FILE" ]; then
    echo "No file selected."
    exit 1
fi

if ! command -v "$EDITOR" &> /dev/null; then
    echo "Editor not found: $EDITOR"
    exit 1
fi

"$EDITOR" "$FILE"
