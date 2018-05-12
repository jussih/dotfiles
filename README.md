# Dotfiles and more as Ansible playbooks for Ubuntu

- Install ansible v2+
  - `sudo apt-get install software-properties-common`
  - `sudo apt-add-repository ppa:ansible/ansible`
  - `sudo apt-get update`
  - `sudo apt-get install ansible`

- To install dotfiles and CLI tools: `ansible-playbook -i hosts -K playbook.yml`
- To install GUI apps: `ansible-playbook -i hosts -K playbook_gui.yml`
