# Introduction
To install the solution, you will need a server to host the solution's backend and Admin Panel. A VPS is a good combination of performance and price for hosting Ridy's server side.
For VPS the minimum requirement is 4GB RAM. You will need an SSH client to access your Server's terminal. The whole installation process is done through SSH.

# Installation
# Firebase: <br>
The app seamlessly integrates with four Firebase modules, one of which is essential for app operation, the Firebase Cloud Messaging service which would allow notification delivery. In this step, we'll configure Firebase so that you can proceed with the platform-specific tasks required for Firebase integration in the following steps.
To begin, visit https://console.firebase.google.com and click the "Add New Project" button to create a new Firebase project. This project will be linked to your Google account.

# Server: <br>
Installing the Backend and Admin panel on your server. <br>
<b>Connect To Server:</b> <br>
The application's server hosting requirement is a VPS with 4GB of memory. It is recommended to have only Ridy installed on the server without any other websites. Once you have purchased the server, you can access the VPS's Terminal interface using the credentials provided by your hosting provider. Typically, this includes the server address and the root user's password.
<br>
<b>Installation</b> <br>
The recommended deployment solution for the server-side is Docker. Once Docker is installed on your server, you can easily run the server-side of the application by executing a single command.
<br>
<b>Install Docker</b>
<br>
To install Docker and Docker Compose, you can refer to the official Docker documentation, which provides detailed instructions based on your server's operating system. Follow the specific documentation provided by Docker for your server's OS to ensure a proper installation of both Docker and Docker.
<br>
<b> Run backend </b> <br>
Now that Docker is installed, navigate to the root folder of your server by using the command cd /root. From there, you can proceed to install Ridy's server-side by executing the following command:
```bash
wget -qO- https://uploads.ridy.io/docker-compose-flutter.yaml > docker-compose.yaml && docker compose up -d
```
After a few seconds, Docker will start up all the required services, and you should be able to access the dashboard by using your IP address and port 4003. <br>
<b> Configuration: </b>
You can access the dashboard on your server from port 4003. (eg. http://x.x.x.x:4003/)
When you open the dashboard for the first time, you will be presented with a Configuration wizard. Below are the details of the steps explained in the wizard:
<br>
<b> Wizard: </b>
<br>
<b>Google Maps API Key</b>
This API key is to be retrieved from the Google Developers console. For the server API key Distance Matrix API API is required and for the dashboard key Google Maps Javascript SDK & Static Maps API are required.
<br>
<b>Firebase Admin SDK:</b> <br>
In the Firebase project, navigate to the Project Settings and locate the Service Accounts section. Click on the Generate Private Key button to obtain the private key in JSON format. Then, upload this JSON file using the provided upload panel. <br>
<br>
<br>
![Image Description](https://i.ibb.co/0B7RmF4/spaces-D1-Hfy-Xgyy-Bd-FLmty-KDu-P-uploads-IAGiq-Rn3i-Pnog-M1l-If-LT-firebase-ezgif-com-webp-to-jpg-c.jpg)











