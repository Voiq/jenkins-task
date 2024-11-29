pipeline{
  agent{
    label 'agent1'
  }
  environment{
    DOCKERHUB_CREDENTIALS = credentials('DockerHub')
  }
  stages{
     stage('Initialize'){
        def dockerHome = tool 'myDocker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
    }
    stage('Build'){
      steps{
        sh """
          ./mvnw package
          docker build -t voidedflesh/petclinic-image:v1 .
        """
        }   
      }
    stage('Login'){
      steps{
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push'){
      steps{
        sh 'docker push voidedflesh/petclinic-image:v1'
      }
    }
    }
  post{
    always{
      sh 'docker logout'
    }
  }
}
