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

This one pops up a graphical configuration wizard. This demonstrates the need to run at least part of the
initial desktop setup playbook from within the graphical environment (since I can't figure out how to
configure Dropbox programmatically:

```
sudo ansible-playbook -i hosts dropbox.yml
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

This is also interesting. When you want to restart the KDE kickoff to pick up your config changes, sudo
removes environment variables that qdbus needs to interact with KDE. So you have to mess with sudo config
or run the playbook as the target user. This irregularity has convinced me that my initial desktop
configuration playbook should just end up saying "okay, log out and log back in please".

```
# Note: no sudo
ansible-playbook -i hosts kickoff.yml
```

I'm not sure generalized "dotfiles" and "packages" playbooks are a good idea, but here they are:

```
sudo ansible-playbook -i hosts dotfiles.yml
sudo ansible-playbook -i hosts packages.yml
sudo ansible-playbook -i hosts emacs.yml
sudo ansible-playbook -i hosts fedorautils.yml
```
