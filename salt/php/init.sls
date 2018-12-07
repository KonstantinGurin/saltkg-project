# Asennetaan php
libapache2-mod-php:
  pkg.installed

# Otetaan kayttoon php konfiguroimalla php7.2.conf tiedosto:
/etc/apache2/mods-available/php7.2.conf:
  file.managed:
    - source: salt://php/php7.2.conf
    - user: root
    - group: root
    - mode: 600

# Tarkistaa oliko vaihdettu php7.2.conf ja paivittaa apache2.service
apache2service2:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/mods-available/php7.2.conf
    - require:
      - pkg: apache2
