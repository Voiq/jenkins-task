pipeline{
  agent{
    label 'agent1'
  }
  environment{
    DOCKERHUB_CREDENTIALS = credentials('DockerHub')
  }
  stages{
    stage('Build'){
      steps{
        sh """
          ./mvnw package
          
          curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
          && tar xzvf docker-17.04.0-ce.tgz \
          && mv docker/docker /usr/local/bin \
          && rm -r docker docker-17.04.0-ce.tgz

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
