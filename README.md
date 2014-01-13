# Dotfiles via Ansible

I used to use Puppet for this. I had a good excuse to start fresh recently, and am migrating to Ansible.

## Getting started

* Log into LastPass to get Dropbox password.
* Log into Dropbox and download sheldonh-gpg.tar and sheldonh-ssh.tar.enc.
* Place sheldonh-gpg.tar and sheldonh-ssh.tar.enc in this directory.
* sudo yum remove PackageKit -y && sudo yum install git ansible -y
* ansible-playbook -i hosts setup.yml
* ssh-agent bash
* ssh-add ~/.ssh/id_rsa
* sudo ansible-playbook -i hosts google-chrome.yml

Once Google Chrome is installed, I log it into my Google account
and it installs LastPass, and then we're off to the races.

## Additional playbooks

Miscellaneous playbooks, messily organized for now:

```
sudo ansible-playbook -i hosts hetzner.yml
sudo ansible-playbook -i hosts konsole.yml
sudo ansible-playbook -i hosts vim.yml
```
