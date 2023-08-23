# on the container destination file we need to create sudhamsh-custom.jar(resides in the conatiner, once image is built and run as a conatiner)
# version number in the pom.xml and dockerfile should be same
FROM openjdk:8
ADD jarstaging/com/valaxy/demo-workshop/2.1.2/demo-workshop-2.1.2.jar sudhamsh-custom.jar 
ENTRYPOINT ["java", "-jar", "sudhamsh-custom.jar"]