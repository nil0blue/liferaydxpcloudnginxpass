# liferaydxpcloudnginxpass
A script to secure the Liferay DXP Cloud dev environment basic authentication


The dev environment portal access in Liferay DXP Cloud is protected by default credentials which are shared in the provisioning email. 
This script provides a way to customize the dev environment nginx configuration and set your own credentials. 
And to avoid committing to the repository implement the credentials  as a Secret.

Steps:

1. Use the htpasswd tool locally to generate the contents of the .htpasswd file:
	
	htpasswd -nb [user] [password]
	
2. Create a Secret in the DXP Cloud DEV environment:
	
	Name: lcp-nginx-basic-auth
	
	Value: the output from Step 1
	
	Used in:
	
	Service: Webserver
	
	Key: LCP_NGINX_BASIC_AUTH
	
	For documentation about how to create Secrets, visit: https://learn.liferay.com/dxp-cloud/latest/en/infrastructure-and-operations/security/managing-secure-environment-variables-with-secrets.html	

3. Copy the webserver folder from this repository to your DXP Cloud repository.
	
	This will add a .htpasswd file and a changepwd shell script to your nginx deployment.
	
4. Commit and push the changes.

5. After the deployment to dev is completed, verify that the changepwd.sh script was executed in the nginx logs.

	The changepwd.sh script replaces the environment varialbe in the .htpasswd file with the value of the Secret.

6. The dev environment will now be accessible using the new credentials.
