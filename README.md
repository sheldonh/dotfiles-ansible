# Dotfiles via Ansible

I used to use Puppet for this. I had a good excuse to start fresh recently, and am migrating to Ansible.

## Getting started

* Log into LastPass to get Dropbox password.
* Log into Dropbox and download sheldonh-gpg.tar and sheldonh-ssh.tar.enc.
* Place sheldonh-gpg.tar and sheldonh-ssh.tar.enc in this directory.
* Then do this:

```
sudo yum remove PackageKit -y && sudo yum install git ansible -y
ansible-playbook -i hosts setup.yml
ssh-agent bash
ssh-add ~/.ssh/id_rsa
sudo ansible-playbook -i hosts google-chrome.yml
```

Once Google Chrome is installed, I log it into my Google account
and it installs LastPass, and then we're off to the races.

## Additional playbooks

Miscellaneous playbooks, messily organized for now:

```
sudo ansible-playbook -i hosts hetzner.yml
sudo ansible-playbook -i hosts konsole.yml
sudo ansible-playbook -i hosts vim.yml
```

This one takes ages:

```
sudo ansible-playbook -i hosts rvm.yml
```

This one doesn't check for change:

```
sudo ansible-playbook -i hosts konversation.yml
```

Configuring konversation is interesting. KDE and Ansible don't agree about with an ini file looks like,
and it's a pain in the butt to write a playbook that checks with kreadconfig before changing with kwriteconfig.

I'm not sure a generalized "dotfiles" playbook is a good idea, but here it is:

```
sudo ansible-playbook -i hosts dotfiles.yml
```
