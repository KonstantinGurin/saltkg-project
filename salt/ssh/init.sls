# Asentaa moduli
openssh-server:
  pkg.installed

# Paivittaa sshd_config tiedoston.
/etc/ssh/sshd_config:
  file.managed:
    - source: salt://ssh/sshd_config
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: openssh-server

# Tarkistaa oliko sshd_config paivitetty ja restartaa sshd service.
# watch: When called, it will restart or reload the named service.
sshd:
  service.running:
    - watch:
      - file: /etc/ssh/sshd_config
    - require:
      - pkg: openssh-server
