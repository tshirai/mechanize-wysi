#! /bin/bash
$1 cucumber features -f junit --out features/reports
$1 rake ci:setup:rspec spec
