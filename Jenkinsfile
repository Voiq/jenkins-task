pipeline{
  agent{
    label 'agent1'
  }
  stages{
    stage('Build'){
      steps{
        sh """
          ./mvnw package
          docker build -t voidedflesh/petclinic-image dockerfile
          docker tag voidedflesh/petclinic-image:v1
          docker push voidedflesh/petclinic-image:v1

        """
        }
      }
    }
    stage('stage2'){
      steps{
        script{
          echo "Running on agent: ${env.NODE_NAME}"
          sh 'echo "hostname is $(hostname)"'
        }
      }
    }
}
