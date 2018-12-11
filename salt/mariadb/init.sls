# MariaDB asennus
mariadb-client:
  pkg.installed

mariadb-server:
  pkg.installed

# PHP-MYSQL tukipaketti, etta tietokanta toimii PHP:n kanssa.
php-mysql:
  pkg.installed

# Kirjautu auttomaattisesti "kgtestdb" tietokantaan.
# Lisaa mode: 660, jos et kayta toista kayttaja jolla ei ole root oikeudet. 
# Mode: 660 lisaamisen jalkeen avataan "sudo mariadb".
/home/xubuntu/.my.cnf:
  file.managed:
    - mode: 660
    - source: salt://mariadb/.my.cnf
 
/tmp/newdbuser.sql:
  file.managed:
    - mode: 600
    - source: salt://mariadb/newdbuser.sql

# Luo uuden tietokantaan nimella "kgtestdb"
'cat /tmp/newdbuser.sql|mariadb -u root':
  cmd.run:
    - unless: "echo 'SHOW DATABASES'|sudo mariadb -u root|grep '^kgtestdb$'"

# Restarttaa apache2. PHP modulien ottaminen kayttoon.
apache2service3:
  service.running:
    - name: apache2
    - reload: True
#    - full_restart: True
    - require:
      - pkg: apache2
