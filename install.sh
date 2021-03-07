#!/bin/sh
clear;
echo -e "Installing total setup\n";
echo "[Installing necessary applications] **********************************";
echo -e "\e[1;36m Wait for sometime...\e[0m";
yum install python3 -y > /dev/null 2>&1;
pip3 install ansible > /dev/null 2>&1;
echo -e "\e[1;33m {\n\t[\"python3\", \"ansible\"]\n }\e[0m";
echo -e "\e[1;32m ----> Done\e[0m\n";
echo "[Making inventory] ***************************************************";
echo -e "[masterNode]\n" > ./ip.txt;
location=$(pwd);
echo -e "\e[1;33m$location/ip.txt\e[0m";
echo -e "\e[1;32m ----> Done\e[0m\n";
echo "[Configuring 'ansible.cfg' file] *************************************";
mkdir -p ./awskey > /dev/null 2>&1;
echo -e "[defaults]\ninventory=$location/ip.txt\ndeprecation_warnings=False\nhost_key_checking=False\nroles_path=/ansibleWS\nremote_user=ec2-user\nask_pass = False\ncommand_warnings = False\nprivate_key_file = $location/awskey/<private key name>\n\n[privilege_escalation]\nbecome = True\nbecome_method = sudo\nbecome_user = root\nbecome_ask_pass = False" > /etc/ansible/ansible.cfg;
echo -e "\e[1;32m ----> Done\e[0m\n";
echo "[Making Ansible role] ************************************************";
echo -e "\e[1;36m Wait for sometime...\e[0m";
ansible-galaxy init /ansibleWS/MasterNode > /dev/null 2>&1;
ansible-galaxy init /ansibleWS/WorkerNode > /dev/null 2>&1;
ansible-galaxy init /ansibleWS/Deployment > /dev/null 2>&1;
echo -e "\e[1;33m {\n\t[\"MasterNode\", \"WorkerNode\", \"Deployment\"]\n }\e[0m";
echo -e "\e[1;32m ----> Done\e[0m\n";
echo "[Configuring Ansible role] *******************************************";
echo -e "\e[1;36m Wait for sometime...\e[0m";
\cp ./create_instances.yml /ansibleWS > /dev/null 2>&1;
\cp ./instanceDetails.yml /ansibleWS > /dev/null 2>&1;
\cp ./setup.yml /ansibleWS > /dev/null 2>&1;
\cp ./MasterNode/tasks/* /ansibleWS/MasterNode/tasks/ > /dev/null 2>&1;
\cp ./MasterNode/templates/* /ansibleWS/MasterNode/templates/ > /dev/null 2>&1;
\cp ./MasterNode/files/* /ansibleWS/MasterNode/files/ > /dev/null 2>&1;
\cp ./MasterNode/handlers/* /ansibleWS/MasterNode/handlers/ > /dev/null 2>&1;
\cp ./WorkerNode/tasks/* /ansibleWS/WorkerNode/tasks/ > /dev/null 2>&1;
\cp ./WorkerNode/files/* /ansibleWS/WorkerNode/files/ > /dev/null 2>&1;
\cp ./WorkerNode/handlers/* /ansibleWS/WorkerNode/handlers/ > /dev/null 2>&1;
\cp ./Deployment/files/* /ansibleWS/Deployment/files/ > /dev/null 2>&1;
\cp ./Deployment/tasks/* /ansibleWS/Deployment/tasks/ > /dev/null 2>&1;
echo -e "\e[1;32m ----> Done\e[0m\n";
chmod 755 ~/.ssh > /dev/null 2>&1;
location=$(pwd);
echo -e "\e[1;36m*******************************************************************\n";
echo -e "\e[1;36m*\e[0m \e[1;31m                   WARNING(ATTENTION PLEASE)                    \e[1;36m*\n";
echo -e "\e[1;36m*\e[0m                                                                 \e[1;36m*\e[0m\n";
echo -e "\e[1;36m*\e[0m            1.  Copy your ec2-instance key-pair here             \e[1;36m*\n";
echo -e "\e[1;36m*\e[0m     \e[1;33m$location/awskey/< > location          \e[1;36m*\n";
echo -e "\e[1;36m*\e[0m            2.  Update this location in ansible.cfg              \e[1;36m*\n";
echo -e "\e[1;36m*\e[0m \e[1;33m             file( /etc/ansible/ansible.cfg )                   \e[1;36m*\n";
echo -e "\e[1;36m*\e[0m            3.  Run this following command                       \e[1;36m*\n";
echo -e "\e[1;36m*\e[0m \e[1;33m         [ chmod 600 <path_to_your_private_key_pair ]           \e[1;36m*\n";
echo -e "\e[1;36m*\e[0m 4.  Create an ansible-vault named awsIamKey.yml in /ansibleWS   \e[1;36m*\n";
echo -e "\e[1;36m*\e[0m \e[1;33m            [ ansible-vault create awsIamKey.yml ]               \e[1;36m*\n";
echo -e "\e[1;36m*\e[0m 5.  Here, you have to store your IAM access_id and secret_key   \e[1;36m*\n";
echo -e "\e[1;36m*\e[0m \e[1;33m                   aws_access_key_id: <id>                      \e[1;36m*";
echo -e "\e[1;36m*\e[0m \e[1;33m                  aws_secret_access_key: <key>                  \e[1;36m*\n";
echo -e "\e[1;36m*\e[0m \e[1;33m        [ To run the program, read README.md properly ]         \e[1;36m*\n";
echo -e "\e[1;36m*******************************************************************\e[0m\n";
echo;echo;
