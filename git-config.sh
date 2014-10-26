#!/bin/bash
git config --global color.ui true
gitalias='git config --global alias'
$gitalias.co checkout
$gitalias.ci commit
$gitalias.st status
$gitalias.br branch
$gitalias.hist "log --all --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
$gitalias.up "remote update --prune"
