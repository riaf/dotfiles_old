#!/bin/sh

# phpmanual
mkdir -p .doc
rm -rf .doc/php
mkdir -p /tmp/phpdoc

curl "http://jp.php.net/distributions/manual/php_manual_ja.tar.gz" | tar zxf - -C /tmp/phpdoc
mv /tmp/phpdoc/php-chunked-xhtml .doc/php
rm -rf /tmp/phpdoc

