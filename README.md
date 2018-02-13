# WP Update Plugins
#### A simple bash script to speed up updating multiple WordPress sites' plugins.

Requires:
* [WP-CLI](https://wp-cli.org/)

Instructions:
* Change to your webroot directory and execute the following shell script with the directories of the sites that you want to update. For example:
`sh wp-update-plugins/wp-update-plugins.sh loc.website.com/ loc.website1.com/`

 
#### Heads up
I tend to have my local projects in the `/var/www` directory, so you may wish to reconfigure this path on line #7. Likewise the path for the logs directory on line #20.
