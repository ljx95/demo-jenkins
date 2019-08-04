#FROM java:8
#VOLUME /tmp
#RUN mkdir /app
#ADD demo-jenkins-0.0.1-SNAPSHOT.jar /app/app.jar
#ADD runboot.sh /app/
#RUN bash -c 'touch /app/app.jar'
#WORKDIR /app
#RUN chmod a+x runboot.sh
#EXPOSE 8082
#CMD /app/runboot.sh
FROM java:8-jre

ADD demo-jenkins-0.0.1-SNAPSHOT.jar /app/
CMD ["java", "-Xmx200m", "-jar", "/app/demo-jenkins-0.0.1-SNAPSHOT.jar"]

EXPOSE 8888
