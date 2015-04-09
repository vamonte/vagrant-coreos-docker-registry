#!/bin/bash

sh ./bin/generate_ssh_config.sh
ansible-galaxy install defunctzombie.coreos-bootstrap -p ./roles
ansible-playbook -i inventory/vagrant bootstrap.yml
ansible-playbook -i inventory/vagrant playbook/registry.yml