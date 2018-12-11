# Asennetaan apache2 paketti
apache2:
  pkg.installed

# Paivitetaan apache2 oletussivu
/var/www/html/index.html:
  file.managed:
    - source: salt://apache2/index.html
    - user: root
    - group: root
    - mode: 644

# Otetaan kaytton userdir.conf ja -.load hakemalla niita kansiosta mods-available ja siirtamalla mods-enabled.
/etc/apache2/mods-enabled/userdir.conf:
  file.symlink:
    - target: ../mods-available/userdir.conf

/etc/apache2/mods-enabled/userdir.load:
  file.symlink:
    - target: ../mods-available/userdir.load

# Otetaan pois directory browsing. Aika yleinen haavoittuvuus.
/etc/apache2/apache2.conf:
  file.managed:
    - source: salt://apache2/apache2.conf
    - user: root
    - group: root
    - mode: 600

# Kaynistaa uudelleen apache2, jos oli otettu muutoksia userdir.conf ja -.load.
# apache2.service oli pakko nimea eri nimeksi, koska muuten tulee virhe "Conflicting ID: apache2". Johtuu apache2 paketista.
# Eli alkuperainen apache2 oli vaihdettu nimeksi apache2service.
apache2service1:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/mods-enabled/userdir.conf
      - file: /etc/apache2/mods-enabled/userdir.load
      - file: /etc/apache2/apache2.conf
    - require:
      - pkg: apache2

# Taytyy aina muokata minionin nimi kun asentaa uudelle koneelle eri nimen kanssa! Nyt on xubuntu.
# makedirs luo kansion public_html
# file_mode asettaa jatkossa oikeudet uusille tiedostiolle mitka luodaan tahan kansioon.
/home/xubuntu/public_html/:
  file.directory:
    - makedirs: True
    - user: root
    - group: root
# drwxr-xr-x
    - dir_mode: 755
# -rw-r--r--
    - file_mode: 644

# Luo tai paivittaa index.php eli kayttajan kotisivu.
/home/xubuntu/public_html/index.php:
  file.managed:
    - source: salt://apache2/public_html/index.php

# Esimerkki tietokantan kaytosta.
/home/xubuntu/public_html/shoplist.php:
  file.managed:
    - source: salt://apache2/public_html/shoplist.php

