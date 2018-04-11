# Dotfiles and more as Ansible playbooks

- To install dotfiles and CLI tools: `ansible-playbook -i ansible/hosts -K ansible/playbook.yml`
- To install GUI apps: `ansible-playbook -i ansible/hosts -K ansible/playbook_gui.yml`