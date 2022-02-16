pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven 'Maven-3.8'
    }

    stages {
        stage('Build jar') {
            steps {
                // Get some code from a GitHub repository              
                // Run Maven on a Unix agent.
                sh "mvn package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
            
        stage('Build image') {
            steps {
                // Get some code from a GitHub repository
                echo 'building image'
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'myPass', usernameVariable: 'myUser')])

                // Run Maven on a Unix agent.
                sh 'docker build -t petclinic1:v1 .'
                sh "echo $myPass | docker login -u $myUser' --password-stdin"
                sh 'docker push petclinic1:v1'

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
            
            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'

            
                }
            }
        }
    }
}
