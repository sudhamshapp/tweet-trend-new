# on the container destination file we need to create sudhamsh-custom.jar(resides in the conatiner, once image is built and run as a conatiner)
# version number in the pom.xml and dockerfile should be same
# jarstaging/com/valaxy/demo-workshop/2.1.2/demo-workshop-2.1.2.jar- this is the artifact path, the demo-worshop-2.1.2 is atifact
# the maven build generates the artifact
# the artifact is present within the jenkins-job(pipeline-job/sample-job under workspaces)
# on the container, what is the destination file we wanna give - sudhamsh-custom.jar(this is arbitary)




FROM openjdk:8
ADD jarstaging/com/valaxy/demo-workshop/2.1.3/demo-workshop-2.1.3.jar sudhamsh-custom.jar 
ENTRYPOINT ["java", "-jar", "sudhamsh-custom.jar"]