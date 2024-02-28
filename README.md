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
<br>
After uploading the Firebase project private key, return to your server's terminal and enter the following command:
```bash
docker compose down
docker compose up -d
```
<br>
You can now open the admin panel address in your browser, and instead of the configuration page, you will be greeted with the login page. Simply use the default admin/admin username and password to log in.
<br>
<b>Setup Twilio</b>
<br>
Once the admin panel is running please head to Settings->API Keys and from the list of API keys fill in the 4 Twilio API keys required with the ones retrieved from the Twilio panel. This integration is required for SMS verification.
<br>
<b>
  Client
</b>
<br>
Configuration and compilation of the client side (Flutter)
<br>
First, we will proceed with the necessary updates for both the Android and iOS apps.
<br>
<b>Android</b>
<br>
To begin, we need to create release keystores for signing the APKs or aab bundles. You can use the command provided below, replacing [key_alias_name] with the desired alias name of your choice:
```bash
keytool -genkey -v -keystore keystore.jks -alias [your_alias_name] -keyalg RSA -keysize 2048 -validity 10000
```
Ensure you have copied this file to the driver's and rider's frontend folders. Then, open the key.properties file located in the android folder and enter the alias name and password you have chosen for the keystore in the appropriate fields. <br>
Now, execute the following command to display the signature of both your system's debug keystore and the release keystore. Take a copy of the SHA-1 and SHA-256 values, as we will need them later.
```bash
../gradlew signingreport
```
Next, open the build.gradle file located in the app folder. Inside this file, you will find the line that specifies the applicationId. Update this line to match the application identifier of your own brand.
<br>
  <b>iOS</b>
  <br>
Next, we will do the same for iOS apps. Please open the Runner.xcworkspace in either rider-frontend/driver-frontend's ios folder. Next click on the Runner project in the left panel so the project settings would appear. Then under the Signing and Capabilities tab, you can change the bundle identifier: 

![Changing Bundle Identifier](https://i.ibb.co/DzPCQzr/assets-MQhar1-HEUDhws-WMLRp1-MQkp-YLu-L4-8-JY3q-UD7-E-MQkqkg-Nz-70-Cl1-Pwa4-X-bundle-identifier-ezgi.jpg)
<br>
<b>Firebase</b>
<br>
You can now head to the Firebase console and create a Flutter Firebase app. <br>
First, you need to install the Firebase CLI. After that, you'll need to log in to your Firebase account using the CLI. Additionally, make sure to install the flutterfire CLI tool. If you already don't have these standard tools installed, follow the guidelines provided by Firebase during the Flutter app creation wizard. <br>
Once you have installed those tools, Firebase will prompt you to connect your apps to the Firebase project. This process is seamless and can be accomplished by executing a command similar to the one provided below by Firebase:<br>
```bash
flutterfire configure --project=something
```
<br>
When you run this command, you will be presented with the option to configure which apps you want to connect with Firebase. You can uncheck the macOS version since its support is not currently maintained.
<br>
<b></b>Android (Post Firebase)</b> <br>
Now, navigate to the Firebase console, where you will notice that Flutterfire has automatically created the necessary Android and iOS apps for you. For both the driver and rider applications created by Firebase, make sure to provide both the previously saved SHA-1 and SHA-256 values. This step is essential for Firebase to verify and accept your verification requests.
<br>
<b>iOS (Post Firebase)</b> <br>
Open the Runner workspaces for both the rider's and driver's iOS applications. Locate the GoogleService-Info.plist file within each workspace. Find the row labeled REVERSE_CLIENT_ID inside this file and copy its corresponding value. <br>
Next, open the Info.plist file and navigate to URL Types -> Item 0 (Firebase) -> URL Schemes -> Item 0. Paste the copied value from the REVERSE_CLIENT_ID row as the new value in this location.
<br>
<b>Pointing to the server</b>
<br>
In order for the apps to communicate with your server's backend, you need to modify the constants.dartfile in the libs/flutter_common/lib/config/constants.dart project. Open the file and locate the variable that specifies the server IP. If you access your admin panel at 1.1.1.1:4003, remove the:4003 part and update the variable's value accordingly. Here's an example of how to edit the variable:
<br>
```bash
- static const String serverIp = "x.x.x.x";
+ static const String serverIp = "1.1.1.1";
```
With the above steps completed, you can now compile either the driver or rider app using Flutter's standard build commands.
<br>
**Android**
```bash
// Build with debug keystore
flutter build apk
flutter build appbundle

// Build with release keystore
flutter build apk --release
flutter build appbundle --release
\```
<br>
<b> IOS</b>


  
  











