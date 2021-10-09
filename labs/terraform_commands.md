# Steps 
1. init 
2. Plan 
3. Apply 


4. terraform show 

5. terraform destroy

5. terraform output

6. terraform output pet-name 

7. terraform.tfstate ( it is Json data better to store S3,Hashicrop Cloud, any storage)

8. terraform plan --refresh=false 

9. terraform.tfstate Better to store in any storage(AWS S3,Google Cloud storage,Terraform cloud )


10. terraform validate : 
       Success! The configuration is valid.
11. terraform fmt :
       format 
12.  terraform show 

13. terraform show -json 

14. terraform providers

15. terraform refresh 

16. terraform graph
    ** Linux 
	        1. apt update 
			2. apt install graphviz -y
			3. terraform graph | dot -Tsvg >graph.svg
17. terraform state list

18. terraform state show azurerm_mysql_server.db-server

19. terraform workspace new welcome_workspace
20. terraform workspace list

21. terraform workspace delete dev 

22. terraform import aws_instance.foo i-bcded1234 ( import an aws instance with ID i-bcded1234 into aws_instace resource named foo

23. terraform import module.foo.aws_instace.bar i-bcded1234

24. terraform taint (informs terraforms that particular object has become degraded or damaged)


25. datasources

26. Specific Resources:
   terraform apply -target=aws_s3_bucket.b 
