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
                
                echo "building image"
         //       withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'myPass', usernameVariable: 'myUser')])
                sh 'docker build -t petclinic1:v1 .'
            //        sh "echo $myPass | docker login -u $myUser' --password-stdin"
            //        sh 'docker push petclinic1:v1'
                }
                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
            
        stage('Build deploy') {
            steps {
                sh 'sudo docker run -d -p 1234:8080 petclinic1:v1'
                

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
