Steps needed to reproduce the issue
on your local machine:
vagrant up --provision
vagrant ssh
# on the guest VM:
$ sudo su
% systemctl reload varnish
% journalctl -r -u varnish
# < Look for the I/O error in the output >
