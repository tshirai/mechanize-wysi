#! /bin/bash
. `dirname $0`/rvm.sh
mkdir -p features/reports
rvm $1 do bundle install --path=vendor/bundle
`dirname $0`/job.sh "rvm $1 do bundle exec"

