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
                sh 'mvn clean deploy -Dmaven.test.skip=true' // in the build whenever we specify deploy it executes unit test cases as well as part of build step
            }
        }
        stage("unit-test"){
            steps{
                echo "------------unit-test-started----------------"
                sh 'mvn surefire-report:report' //this is the command to run unit test cases separately, unit test cases by default runs as a surefire plugin
                echo "------------unit-test-completed----------------"
            }

        }
        
        stage('SonarQube analysis') {
            environment {
                scannerHome = tool 'sudhamsh-sonar-scanner'  // This is found under Tools
            }
            
            steps {
                withSonarQubeEnv('sonarqube-server') { // This is found under system
                    sh "${scannerHome}/bin/sonar-scanner" // This communicates with our SonarQube server and sends the analysis report
                }
            }
        }
    }
}
