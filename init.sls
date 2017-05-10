pkg_bacula:
  pkgrepo.managed:
    - ppa: hawq/bacula
  pkg.latest:
    - name: bacula-client
    - refresh: True
rm_bconsole:
  cmd.run:
  - name: rm /etc/bacula/bconsole.conf
  - require:
    - pkg: pkg_bacula
rm_common_default_passwords:
  cmd.run:
  - name: rm /etc/bacula/common_default_passwords 
  - require:
    - pkg: pkg_bacula
var_spool_bacula_dir:
  file.directory:
  - name: /var/spool/bacula
  - user: bacula
  - group: bacula
  - require:
    - pkg: pkg_bacula
/etc/bacula/bacula-fd.conf:
  file.managed:
  - source: salt://bacula/files/bacula-fd.conf
  - template: jinja
