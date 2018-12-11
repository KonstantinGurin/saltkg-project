# SALTKG-PROJECT
#### Course: [Palvelinten hallinta ict4tn022](http://terokarvinen.com/2018/aikataulu-palvelinten-hallinta-ict4tn022-3004-ti-ja-3002-to-loppukevat-2018-5p)
#### Teacher: [Tero Karvinen](http://terokarvinen.com/)

This project will install next packages and configurations:
- Apache2
- MariaDB
- PHP
- SSH
- UFW enable firewall and configure for SSH connection via 8870 port
- Disables directory browsing
- BASH


Watch full install/update list in directory salt/bash/updates.txt or simply run "runme.sh" bashscript.

You need to change minions name in this .sls file, if your minions name other than xubuntu!
You will find it:
Here --> /salt/apache2/init.sls
Here --> salt/mariadb/init.sls

Project have been tested on Xubuntu 18.04.
