pipeline{
  agent{
    label 'agent1'
  }
  environment{
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages{
    stage('Maven Install'){
      steps{
        script{
          docker.image('maven:3.9.7').inside{
            sh 'mvn clean install'
          }
        }

        }
       
      }
    stage('Docker build'){
      steps{
        sh './mvnw package'
        sh 'docker build -t voidedflesh/petclinic-image:latest'
        }
      }
    stage('Docker Push'){
      steps{
        withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
        sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
        sh 'docker push voidedflesh/petclinic-image:latest' 
       }
      }}

}
}
