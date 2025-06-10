#!/bin/bash
# alias j2lint:='j2lint $0 --ignore jinja-variable-lower-case'


j2lint() {

command  j2lint $1 --ignore jinja-variable-lower-case
}

