#!/bin/bash
# ./wp/update-plugins.sh loc.website.com/ loc.website2.com/

# Loop through arguments of directories
for var in "$@"
do
  cd /var/www
  cd "$var"

  # Strip trailing slash from dir name; hyphenate any an extra slashes
  prettydir=$(echo ${var%/} | sed -e 's/\//-/g')

  # Datetime to insert into update log filename
  datetime=$(date '+%Y%m%d_%H%M%S');

  # Pretty date time for the update log
  prettydatetime=$(date '+%Y/%m/%d %H:%M:%S');

  # Full path to the update log dir
  outputfile=/var/www/wp/wp-update-plugins/logs/${prettydir}_${datetime}.txt

  # Output for update log file
  printf "WP Update generated at ${prettydatetime}\n\n" >> $outputfile
  ./wp-cli.phar plugin list --update=available --field=name >> $outputfile

  # Perform the updates
  ./wp-cli.phar plugin update --all

  echo "\033[43m Updated $var\033[0m"
done
