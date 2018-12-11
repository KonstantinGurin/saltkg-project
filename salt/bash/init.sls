# Lataa bash scriptin kotikansioon.
/home/xubuntu/runme.sh:
  file.managed:
    - source: salt://bash/runme.sh
    - user: root
    - group: root
    - mode: 755

# Nyt pystyy ajaa "runme" bash scriptin jokaisessa kansiossa.
/usr/local/bin/runme.sh:
  file.managed:
    - source: salt://bash/runme.sh
    - user: root
    - group: root
    - mode: 755

# Luettelo paivityksista ja latauksista.
/home/xubuntu/updates.txt:
  file.managed:
    - source: salt://bash/updates.txt

# Katsotaan mita loytyy minionin kotikansiossa.
# Samalla tarkistetaan, etta meidan bash scripti on ladattu.
list_home_dir:
  cmd.run:
    - name: ls -l /home/xubuntu/

# Ajetaan bash scripti.
run_runme:
  cmd.run:
    - name: runme.sh /home/xubuntu/

#Run runme script:
#  cmd.script:
#    - name: runme.sh
#    - source: salt://bash/runme.sh
#    - cwd: /
