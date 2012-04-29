#! /bin/bash
`dirname $0`/rvm.sh
mkdir -p features/reports
rvm $1 do bundle install --path=vendor/bundle
rvm $1 do bundle exec cucumber features -f junit --out features/reports
rvm $1 do bundle exec rake ci:setup:rspec spec

