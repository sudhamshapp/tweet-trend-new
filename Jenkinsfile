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
                sh 'mvn clean deploy'
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
