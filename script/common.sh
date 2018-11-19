#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

SERVER_ADDRESS=${SERVER_ADDRESS:-"127.0.0.1"}

# Functions
log_info() {
    printf "$GREEN[$(date +"%F %T,%3N")] $1$NC\n"
}

log_error() {
    printf "$RED[$(date +"%F %T,%3N")] $1$NC\n"
}

check_require() {
    if [[ -z ${2//[[:blank:]]/} ]]; then
        log_error "$1 is required"
        exit 1
    fi
}

move_seahub_dir() {
    if [[ ! -d /seahub ]]; then
        mv $LATEST_SERVER_DIR/seahub /
        ln -sf /seahub $LATEST_SERVER_DIR/seahub
    fi
}