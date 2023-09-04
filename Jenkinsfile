def registry = 'https://marssudhamsh.jfrog.io/'
// def imageName = 'sudhamsh01.jfrog.io/sudhamsh-docker-local/mars'
// def version = '2.1.2'

pipeline {
    agent {
        node {
            label 'maven'
        }
    }

    environment {
        PATH = "/opt/apache-maven-3.9.4/bin:$PATH"
    }

    stages {
        stage("Build") {
            steps {
                sh 'mvn clean deploy -Dmaven.test.skip=true'
            }
        }

        stage("unit-test") {
            steps {
                echo "------------unit-test-started----------------"
                sh 'mvn surefire-report:report'
                echo "------------unit-test-completed----------------"
            }
        }

        // stage('SonarQube analysis') {
        //     environment {
        //         scannerHome = tool 'sudhamsh-sonar-scanner'  // This is found under Tools
        //     }
        //     
        //     steps {
        //         withSonarQubeEnv('sonarqube-server') { // This is found under system
        //             sh "${scannerHome}/bin/sonar-scanner" // This communicates with our SonarQube server and sends the analysis report
        //         }
        //     }
        // }

        // stage("Quality Gate") {
        //     steps {
        //         script {
        //             timeout(time: 1, unit: 'HOURS') { // Just in case something goes wrong, the pipeline will be killed after a timeout
        //                 def qg = waitForQualityGate() // Reuse taskId previously collected by withSonarQubeEnv
        //                 if (qg.status != 'OK') {
        //                     error "Pipeline aborted due to quality gate failure: ${qg.status}"
        //                 }
        //             }
        //         }
        //     }
        // }

        stage("Jar Publish") {
            steps {
                script { // this is a groovy script
                    echo '<--------------- Jar Publish Started --------------->'
                    def server = Artifactory.newServer(url: registry + "/artifactory", credentialsId: "jfrog-credentials")
                    def properties = "buildid=${env.BUILD_ID},commitid=${GIT_COMMIT}";
                    def uploadSpec = """{
                        "files": [
                        {
                            "pattern": "jarstaging/(*)",
                            "target": "libs-release-local/{1}",
                            "flat": "false",
                            "props": "${properties}",
                            "exclusions": ["*.sha1", "*.md5"]
                        }
                        ]
                    }"""
                    def buildInfo = server.upload(uploadSpec)
                    buildInfo.env.collect()
                    server.publishBuildInfo(buildInfo)
                    echo '<--------------- Jar Publish Ended --------------->'
                }
            }
        }

        // stage("Docker Build") {
        //     steps {
        //         script {
        //             echo '<--------------- Docker Build Started --------------->'
        //             app = docker.build(imageName + ":" + version)
        //             echo '<--------------- Docker Build Ends --------------->'
        //         }
        //     }
        // }

        // stage("Docker Publish") {
        //     steps {
        //         script {
        //             echo '<--------------- Docker Publish Started --------------->'
        //             docker.withRegistry(registry, 'jfrog-credentials') {
        //                 app.push()
        //             }
        //             echo '<--------------- Docker Publish Ended --------------->'
        //         }
        //     }
        // }
    }
}



// pipeline {
//     agent any
//     stages{
//         stage('clone'){
//             steps{
//                 echo "cloning the git"

//             }
//         }
//         stage('Build'){
//             steps{
//                 echo "build the app"

//             }
//         }
//         stage('publish the artifactory'){
//             steps{
//                 echo "deploying the app"

//             }
//         }



//     }

// }








pipeline {
    agent any
    stages {
        stage() {
            steps {
                echo "cloning the git"

            }
        }
        stage() {
            steps {
                echo "building the app"
            }
        }
        stage() {
            steps {
                echo "deploying the app"
                
            }
        }
    }
}