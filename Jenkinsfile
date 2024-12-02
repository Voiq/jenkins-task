pipeline{
  agent{
    label 'agent1'
  }
  environment{
    DOCKERHUB_CREDENTIALS = credentials('DockerHub')
  }
  stages{
    stage('Maven Install'){
      agent{
        docker{
          image maven:3.5.0
          }
        }
      steps{
        sh 'mvn clean install'
        } 
      }
    stage('Docker build'){
      steps{
        sh 'docker build -t voidedflesh/petclinic-image:latest'
        }
      }
    stage('Docker Push'){
      steps{
        withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'DockerHubPassword', usernameVariable: 'DockerHubUser')]) {
        sh "docker login -u ${env.DockerHubUser} -p ${env.DockerHubPassword}"
        sh 'docker push voidedflesh/petclinic-image:latest' 
       }
      }}
  post{
    always{
      sh 'docker logout'
    }
  }
}
}
