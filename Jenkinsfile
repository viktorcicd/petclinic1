pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven 'maven-3.8'
    }

    stages {
        stage('Build jar') {
            steps {               
                sh "mvn package"               
            }     
        }
     
        stage('Build image') {
            steps {               
                sh "./mvnw spring-boot:build-image"
               
            }
        }
        stage('Build deploy over SSH') {
            steps {
               // def dockerC = 'docker run
                sshagent(['ec2-server-key']) {
                    sh "ssh -o StrictHostKeyChecking=no ubuntu@10.0.10.149"               
                }
            }
        }
    }
}
