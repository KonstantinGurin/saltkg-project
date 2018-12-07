# Asentaa moduli
openssh-server:
  pkg.installed

# Paivittaa sshd_config tiedoston.
/etc/ssh/sshd_config:
  file.managed:
    -source: saltkg-project://ssh/sshd_config

# Tarkistaa oliko sshd_config paivitetty ja restartaa sshd service.
sshd:
  service.running:
    - watch:
      - file: /etc/ssh/sshd_config
