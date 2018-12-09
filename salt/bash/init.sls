# Lataa bash scriptin kotikansioon.
/home/kgminion1/hello.sh:
  file.managed:
    - source: salt://bash/hello.sh
    - user: root
    - group: root
    - mode: 755

# Nyt pystyy ajaa "hello" bash scriptin jokaisessa kansiossa.
/usr/local/bin/hello.sh:
  file.managed:
    - source: salt://bash/hello.sh
    - user: root
    - group: root
    - mode: 755

# Katsotaan mita loytyy minionin kotikansiossa.
list_home_dir:
  cmd.run:
    - name: ls -l /home/kgminion1/

run_hello:
  cmd.run:
    - name: hello.sh /home/kgminion1/
