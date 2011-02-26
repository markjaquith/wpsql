#!/bin/bash
sqlname=`grep -oP "define\s*\(\s*['\"]DB_NAME['\"]\s*,\s*['\"]([^'\"]+)['\"]" $1 | cut -d, -f2 | sed "s/^ \+//" | sed "s/['\"]//g"`
# echo $sqlname
sqluser=`grep -oP "define\s*\(\s*['\"]DB_USER['\"]\s*,\s*['\"]([^'\"]+)['\"]" $1 | cut -d, -f2 | sed "s/^ \+//" | sed "s/['\"]//g"`
# echo $sqluser
sqlhost=`grep -oP "define\s*\(\s*['\"]DB_HOST['\"]\s*,\s*['\"]([^'\"]+)['\"]" $1 | cut -d, -f2 | sed "s/^ \+//" | sed "s/['\"]//g"`
# echo $sqlhost
sqlpass=`grep -oP "define\s*\(\s*['\"]DB_PASSWORD['\"]\s*,\s*['\"]([^'\"]+)['\"]" $1 | cut -d, -f2 | sed "s/^ \+//" | sed "s/['\"]//g"`
# echo $sqlpass
mysql -h $sqlhost -u $sqluser -p$sqlpass $sqlname