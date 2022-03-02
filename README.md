# Ruby on Rails PhotoSite Application and Deploying it on Amazon Web Services using Dcoker

- [Introduction](https://github.com/Akash274/Project_R_AWS/wiki#section-1-introduction-and-purpose)
- [Creating Ruby on Rails PhotoSite Application](https://github.com/Akash274/Project_R_AWS/wiki#steps-followed-to-create-ruby-on-rails-application)
- [Running PhotoSite using Ruby Mine IDE](https://github.com/Akash274/Project_R_AWS/wiki#steps-followed-to-create-ruby-on-rails-application)
- [Docker Container](https://github.com/Akash274/Project_R_AWS/wiki#docker-container)
- [Docker Image](https://github.com/Akash274/Project_R_AWS/wiki#docker-image)
- [Create Docker Image and Running locally using Docker Image](https://github.com/Akash274/Project_R_AWS/wiki#create-docker-image)
- [AWS EC2 Instance creation](https://github.com/Akash274/Project_R_AWS/wiki#aws-ec2-instance-creation)
- [AWS EC2 Deployment of PhotoSite app using Docker Image](https://github.com/Akash274/Project_R_AWS/wiki#aws-ec2-deployment-of-photosite-app-using-docker-image)
- [AWS S3 Bucket](https://github.com/Akash274/Project_R_AWS/wiki#aws-s3-bucke)
- [PhotoSite running on AWS EC2 Instance](https://github.com/Akash274/Project_R_AWS/wiki#aws-ec2-instance-running-photosite-access)
- [PhotoSite Application Status](https://github.com/Akash274/Project_R_AWS/wiki#section-3-this-application-is-working-properly-end-to-end-no-open-issue-is-present)
- [YouTube URL for Project Demo](https://github.com/Akash274/Project_R_AWS/wiki#section-4--youtube-url)
- [Special Issue 1’s Solution - AWS EC2 instance's image creation](https://github.com/Akash274/Project_R_AWS/wiki#aws-ec2-instances-image-creation)
- [Special Issue 2’s Solution - AWS EC2 instance's Elastic IPs](https://github.com/Akash274/Project_R_AWS/wiki#aws-ec2-instances-elastic-ips)
- [PhotoSite Image Used Reference](https://github.com/Akash274/Project_R_AWS/wiki#photosite-images-taken-from---httpborgcsueastbayedugrewecs651projectr_aws_part1tipshtml)

## Section 1

### 1. Introduction
This project demonstrates the work done using Ruby on Rails development and its deployment using Docker, DockerHub and Amazon Web Services using AWS S3 storage bucket and AWS EC2 instance creating and deploying application onit.
This is a Photo-sharing application made using Ruby on Rails. 
A user can view photos and comments by clicking on the name of a user.The application has a comment section that has its comments stored in an SQLite database. The images used for this application are stored in the S3 bucket. Docker image for this project is created and stored on Docker Hub. This application is deployed and runs on an AWS EC2 instance using a docker image from Docker Hub.
EC2 instances support Elastic IP address so that EC2 instance start and stop instance doesn't change the public IP address for access to the Photo-sharing application.
The EC2 instance has an image copy saved so that when the EC2 instance is under heavy load or has a failure copy, this EC2 instance can be launched for load balancing without the need for Photo-sharing application deployment again and quickly.

Youtube: https://youtu.be/sZrrzpZJA9U

Application Link: http://18.213.207.246:3000/

Github: https://github.com/Akash274/Project_R_AWS/

Github Wiki: https://github.com/Akash274/Project_R_AWS/wiki

### 2. Creating Ruby on Rails Photo-Sharing Application
#### Steps to create a Ruby on Rails Application.
* Create a new Ruby on Rails application project.
  New Project -> Rails -> application -> add Ruby SDK and Rails version. For database select sqlite3. Click Create
* Create two Controllers for user and photo
* Go to Tools -> Run Rails Generator -> select rails g controller->Give appropriate name to the model
* Create three models for user, photo, comment
  Go to Tools -> Run Rails Generator -> select rails g model-> Give appropriate name to the model along with columns and data type  for creating a database
* Go to
  db -> migrate 
You will see files generated for the user, photo and comment. Add the columns you want to add in the database and specify their data type. 
* Create a new data migration file load_data or you can load the data manually through the database console by creating table
* Run the migration file by the following command RubyMine IDE: 
  rake db:migrate
* Go to views and create index.html.erb file for photo and user 
* Update routes.rb file to serve user/index and photo/index/:id pages
##### Running Photo-Sharing Application locally using Ruby Mine IDE
1. Run this project using Ruby Mine IDE. This will start server in listening mode.
![screenshot image](screenshot1.png)
2. Open "http://localhost:3000/user/index" PhotoSite URL in browser. This shows PhotoSite app's HOME page.
Click on index #4 and it will open new page. This will shows images, comments posted with date & time.
![screenshot image](screenshot2.png)
![screenshot image](screenshot3.png)
![screenshot image](screenshot4.png)

##### Demonstrating Application deployed successfully on Docker
Docker is used to create image of the container of the application. It helps in reducing the processing power and the efforts to install dependencies seperately for each application. The docker image can be pulled by anyone and deploy it in no time and this help is easy deployment of application on AWS.
To create the docker image we need to add Dockerfile and a docker-compose.yml file in the root repository of Ruby on Rails Application. Follwing this steo we will have to create a docker hub account if one does't have it and create a repository in it.
After that we create the docker image which is used for deploying on AWS EC2 instance.
######## Creating Docker file in application
1. Add the docker file in the Ruby Mine IDE project. This contains the ruby version alongs with other dependencies with the installation instruction for creating docker image.
![screenshot image](screenshot5.png)
2. Add docker-compose.yml file in the project. This contains version and rails server port information.
![screenshot image](screenshot6.png)
######## Creating Docker Hub repository
1. After logging in with docker hub account, click on repository and enter the repository name and the description for the repository.
![screenshot image](screenshot7.png)
2. After creating the repository we will be able to push the docker image onto it and it will show the command for the same.
![screenshot image](screenshot8.png)
######## Building Docker Image in Ruby Mine IDE
1. Go to the application folder directory using the terminal where the dockerfile is present and run the command
  docker build -t amhatre2/group5:project_r_aws_web .
 ![screenshot image](screenshot9.png)
  this has the name of the repository as well as a tag as flag 
2. After creating the docker image run it on the local system using the command
  docker run amhatre2/group5:project_r_aws_web
![screenshot image](screenshot10.png)
3. After confirming that the docker is running we can push it to our repository using command after loging in to docker hub 
  docker push amhatre2/group5:project_r_aws_web
![screenshot image](screenshot11.png)
4. We build docker-commpose file
docker-compose build
![screenshot image](screenshot12.png)
5. After creating we run the docker compose file and create and migrate database
docker-compose run web rails db:create db:migrate
![screenshot image](screenshot13.png)
6. After that use the following command to aggregate the output.
docker-compose up
![screenshot image](screenshot14.png)
Application running on local host on docker
![screenshot image](screenshot15.png)
![screenshot image](screenshot16.png)
![screenshot image](screenshot17.png)

