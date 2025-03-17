# Movie DB



## Instructions
-Build docker file for flask
-Build docker file 2 for nginx
-Build docker compose


## Steps for deployment
-Push files to github repo
  a. $ git add .
  b. $ git commit -m "flask-react app"
  c. $ git push origin main
-push dockerfiles to dockerhub
  a. docker tag nginx-backend:1.0 jeremyhuegel/nginx-backend:1.0
  b. docker push jeremyhuegel/nginx-backend:1.0
  b. docker tag flask-backend:1.0 jeremyhuegel/flask-backend:1.0
  c. docker push jeremyhuegel /flask-backend:1.0
-Create AWS resource
  a. Create a main.tf file to create AWS EC2
  b. Manually create an AWS S3 Bucket
  c. Manually create a dynamodb table
-Create Github Actions Workflow
  a. In the root directory of the project create a .github directory -> create a workflow directory and build a deploy-app.yml
  b. When Ready to push app to EC2 through github actions
  c. $ git add .
  d. $ git commit -m "github actions workflow"
  e. $ git push origin main
  f. Github action will start deployment
