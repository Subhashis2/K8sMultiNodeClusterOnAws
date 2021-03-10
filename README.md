# Kubernetes Multi-node cluster using Ansible roles over AWS cloud
<img src="https://my-task--bucket.s3.ap-south-1.amazonaws.com/ansible_k8s.jpg" width="500" height="300">
<h4>Hi, this is </h4><h2><a href="https://www.linkedin.com/in/subhashis-paul/">Subhashis Paul</a></h2>

* It is a simple program to create multi-node cluster on the top of Kubernetes, using Ansible tool over AWS cloud using ec2-instances. Using ansible-playbook, we launch ec2-instances for master node and worker nodes. Then using Ansible-roles we configure docker, kubernetes applications and atleast after setting up the master and worker node, it creates a deployment and we can access our own webapplication over there.
* This project can be run only in RedHat flavoured operating systems like RHEL, centos, AWS-ami. Because it uses `yum` command for package installation. But you can customise it yourself according to your operating system. Just edit the `install.sh` file. 
* Hope you guys like my project.
* Here is some instructions, how you can use the project yourself. Hope it will help you.

***Warning!!..Do not run any program according to your choice. It may throw errors. Follow the steps, read the instructions carefully***

## Follow the following steps
* First download the git package using provided url.
```html
git clone https://github.com/Subhashis2/K8sMultiNodeClusterOnAws.git
```
* Go to `K8sMultiNodeClusterOnAws` directory. Here you can see, `install.sh` is the installation file for entire setup.
* First make the `install.sh` file executable using the following command. 
```sh
chmod 755 install.sh
```
* Then run the `install.sh` file using  the following command.
```sh
bash install.sh
```
or you can run directly use this following command.
```sh
chmod 755 install.sh
```
```sh
./install.sh
```
* If everything runs successfully then read the given instructions carefully. 
* **First you have to download your aws ec2-instance key-pair in the provided location. Then run the following command.**
```sh
chmod 600 <your_private_key_pair_name>
```
* **Then update the location of key-pair in the ansible configuration file** `/etc/ansible/ansible.cfg`.
* **Then go to the `/ansibleWS` directory and open the `instanceDetails.yml` file using your favourite editor and fill it properly**.
* **Now it is the most important step, we have to do. We have to make `ansible-vault` to store the AWS Iam user access_key and secret_key.** Use the follow command to create vault and use the proper keywords, other wise it will through error in the program. **Use `awsIamKey.yml` name only,** because it is hard-coded in the program.
```sh
ansible-vault create awsIamKey.yml
```
* **Use this format only.**
```sh
aws_access_key_id: <access_key>
aws_secret_access_key: <secret_key>
```
* **After doing this steps successfully, run the following commands one after another. It can take more than 10 minutes, please make patience.**
```sh
ansible-playbook --ask-vault-pass create_instances.yml
```
```sh
ansible-playbook setup.yml
```
>After successfull running the `setup.yml` program, at the end, it will give some urls, you copy-paste this links on your browser and see the web-application is running. Sometime it takes 2-4 minutes to deploy, so wait for sometime.
```html
http://<public_ip>:30080
```
## Thank you
