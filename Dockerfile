FROM tomcat:latest

RUN wget  http://10.0.7.107:8082/remote.php/webdav/iam/iam-https.war?downloadStartSecret=sy7fhxt1vkr5yd0zdfb027qfr --http-user=kevin --http-password=kevin -O iam-https.war
RUN unzip iam-https.war -d /usr/local/tomcat/webapps/iam/ 

