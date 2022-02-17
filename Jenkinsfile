pipeline {
    agent any

    tools {
        
        maven 'Maven-3.8'
    }

    stages {
        stage('Build jar') {
            steps {
                
                sh "mvn package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }     
        }
     
        stage('Build image') {
            steps {
                
                sh "./mvnw spring-boot:build-image"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        
            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
               //   archiveArtifacts 'target/*.jar'

            
                }
            }
        }
    }
}
