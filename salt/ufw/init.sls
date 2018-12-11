/etc/ufw/ufw.conf:
  file.managed:
    - source: salt://ufw/ufw.conf
    - user: root
    - group: root
    - mode: 600

/etc/ufw/user.rules:
  file.managed:
    - source: salt://ufw/user.rules
    - user: root
    - group: root
    - mode: 600

/etc/ufw/user6.rules:
  file.managed:
    - source: salt://ufw/user6.rules
    - user: root
    - group: root
    - mode: 600

ufwservice:
  service.running:
    - name: ufw
    - watch:
      - file: /etc/ufw/ufw.conf
      - file: /etc/ufw/user.rules
      - file: /etc/ufw/user6.rules
