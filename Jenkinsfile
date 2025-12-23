
pipeline {
    agent any
    
    stages {
        stage('SCM Checkout') {
            steps {
                retry(3) {
                    git branch: 'main', url: 'https://github.com/rashidrzn8/jenkinsAndDocker'
                    
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ahamedrashid/nodeapp-cuban:${BUILD_NUMBER} .'
            }
        }
        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'samin-docker', variable: 'rashid1234')]) {
                    script {  
                        sh "docker login -u ahamedrashid -p '${rashid1234}'"
                    }
                }
            }
        }
        stage('Push Image') {
            steps {
                sh "docker push ahamedrashid/nodeapp-cuban:${BUILD_NUMBER}"
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
