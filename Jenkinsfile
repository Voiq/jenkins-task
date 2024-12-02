pipeline{
  agent{
    label 'agent1'
  }
  environment{
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages{
       
    stage('Docker build'){
      steps{
        sh 'docker build -t voidedflesh/petclinic-image .'
        }
      }
    stage('Docker Push'){
      steps{
        withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
        sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
        sh 'docker push voidedflesh/petclinic-image:latest' 
       }
      }}
    stage('Docker Compose'){
      steps{
        sh 'docker compose up'
      }
    }  

}
}
