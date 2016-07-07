#!/bin/bash
#Nothing special.. just a wrapper on long command

ansible-playbook -i "localhost," -c local review-request.yml
