```
-- fork the github repository :
    
    https://github.com/ramannkhanna2/Devops-terraform-ansible.git
    

--- gittbash download
 https://git-scm.com/downloads
 
 ---- clone the github repo :
     
git clone https://github.com/ramannkhanna2/Devops-terraform-ansible.git
  510  ls
  511  clear
  512  cd Devops-terraform-ansible/


---- creation of jenkins server :
    
CentOS 7 (x86_64) - with Updates HVM

sg :22,80,8080

--- log into my server and change the hostname to jenkins ....

=========================================
jenkins deploymnt :

yum update -y
yum install wget -y

---   https://pkg.jenkins.io/redhat-stable/

publicIP:8080

systemctl status jenkins
systemctl start jenkins

--- follow the steps on the application and be on homepage of jenkins

===================================================

---- to provide jenkins root previlegs :


systemctl status jenkins

vi /usr/lib/systemd/system/jenkins.service



# Unix account that runs the Jenkins daemon
# Be careful when you change this, as you need to update the permissions of
# $JENKINS_HOME, $JENKINS_LOG, and (if you have already run Jenkins)
# $JENKINS_WEBROOT.
User=root
Group=root



systemctl daemon-reload

systemctl restart jenkins

-- confirm if it has the access now to make configuration changes on server

========================================================================


creating the workflow :


add the vcs to my project 

-- install terraform on jenkins server

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli


------ create a role on aws to authenticate ur aws account to ur jenkin server

admin-role
attach the role to jenkins server

=================================================

--- install ansible on centos host machine 

sudo yum install epel-release
sudo yum install ansible


-- vi /etc/ansible/ansible.cfg
   uncomment host_key_checking=FALSE


--- create a keypair on centos hostmachine to import a keypair named raman-import on aws virginia region to authenticate :
ssh-keygen -t rsa
-- import the public key to virginia in creation raman-import key


workflow :

terraform init
terraform apply -auto-approve
sleep 10
ansible-playbook -i /tmp/inv -u ec2-user -b --become-method sudo web.yaml




# in case of gcp :

workflow:
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your/service-account-key.json"
terraform init
terraform apply -auto-approve
sleep 10
ansible-playbook -i /tmp/inv -u admin -b --become-method sudo web.yaml



----- build ur pipeline 

============================================

-- create a polll 
* * * * *

----- use the gitbash to push the change

 vi web.yaml
  519  git add .
  520  git commit -m " updated the end content"
  521  git push origin main


======================================================================================
```
