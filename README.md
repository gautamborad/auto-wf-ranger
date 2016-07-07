# auto-wf-ranger
Auto workflow for creating Ranger RR

## Setup on Ubuntu


### install Ansible
    $ sudo apt-get install software-properties-common
    $ sudo apt-add-repository ppa:ansible/ansible
    $ sudo apt-get update
    $ sudo apt-get install ansible

### install rbtools
    $ pip install -U RBTools

### put the following in ~/.reviewboardrc
    REVIEWBOARD_URL = "https://reviews.apache.org/"
    REPOSITORY = "ranger"
    BRANCH = "master"
    LAND_DEST_BRANCH = "master"

### clone gautamborad/auto-wh-ranger
    $ mkdir -p ~/work && cd ~/work
    $ git clone https://github.com/gautamborad/auto-wf-ranger.git
    
### login to rbt
    $ rbt login
    

## Process to create RR
* cd ~/work/auto-wf-ranger
* copy the patch file under the patches/ dir. Note: If there are multiple files, all of them will be applied and a single final patch file will be created
* check that you are logged in to 'rbt login'
* modify variables in the 'vars' section of review-request.yml. 
       Important vars to modify:
          - ranger_bug_id : The id of the bug. Eg : RANGER-1001
          - ranger_bug_commit_msg: The commit message to give. 
          - file_review : True/False. Whether to file review or not
          - test_compile: True/False. Whether to compile with the patch before filing for review
          - ranger_branch: The branch name against which to file review
      One time vars to modify:
          - src_dir: The absolute path to ranger source dir (git pull etc will be done here)
          - ranger_repo: The git repo url
          - patches_dir: The input dir from which patches will be read. By default "patches"
    
* Run the playbook
    $ bash file_review.sh 


