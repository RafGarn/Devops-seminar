pipeline {
    agent any

    stages {
        stage('Pre-build stg') {
            steps {
                echo 'Prebuild actions..'
            }
        }
        stage('Build') {
            steps {
              sh 'echo "docker build --target Build"'
            }
        }
        stage('Test') {
            steps {
                sh 'echo "docker build --target test"'
            }
        }
        stage('Security') {
            steps {
                sh 'echo "This is security"'
            }
        }
        stage('Back-end') {
            steps {
                sh 'echo "mvn --version"'
            }
        }
        stage('Front-end') {
            steps {
                sh 'echo "node --version"'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "s3 cp src dst"'
            }
        }
        stage('Post') {
            steps {
                echo "Clear env"
            }
        }
    }
}
