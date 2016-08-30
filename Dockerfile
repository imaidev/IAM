FROM tomcat7-jre8:latest

RUN mkdir iam

RUN cp Dockerfile iam/Dockerfile

WORKDIR iam

RUN wget https://dev.imaicloud.com/files/comic/IAM-war/iam.war

RUN sudo jar -xvf iam.war

# test start
RUN echo 'dataSource.driverClassName=org.gjt.mm.mysql.Driver' > WEB-INF/classes/datasource.properties
RUN echo 'dataSource.url=jdbc:mysql://10.0.7.107:3306/iam?useUnicode=true&characterEncoding=utf-8&useOldAliasMetadataBehavior=true&allowMultiQueries=true' >> WEB-INF/classes/datasource.properties
RUN echo 'dataSource.username=root' >> WEB-INF/classes/datasource.properties
RUN echo 'dataSource.password=root' >> WEB-INF/classes/datasource.properties
# test end

ADD WEB-INF /tomcat/webapps/iam/