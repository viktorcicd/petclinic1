pipeline {
    agent any

    tools {
        
        maven 'Maven-3.8'
    }

    stages {
        
            
        stage('Build deploy') {
            steps {
                
                sshagent(['Victor-key-frankfurt']) {
                    sh 'scp target/*jar ubuntu@3.121.40.168:/home/jenkins' 
                    
                }

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
