pipeline {
    agent {
        node {
            label 'maven'
        }
    }

    stages {
        stage('cloning the repo') {
            steps {
                git branch: 'main', url: 'https://github.com/sudhamshapp/tweet-trend-new.git'
            }
        }
    }
}
