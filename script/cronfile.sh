#!/bin/bash

. /home/john/.bash_profile
. /home/john/.bashrc
cd /home/john/Documents/ruby/rails/clsearch_prototype
/bin/bash --login
/bin/bash -l -c 'cd /home/john/Documents/ruby/rails/clsearch_prototype && bin/rails runner -e development '\''Search::QueryRunner.send_emails'\''' #> emailoutputfromcronfile
exit
