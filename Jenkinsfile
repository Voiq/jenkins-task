pipeline{
  agent{
    label 'agent1'
  }
  stages{
    stage('stage1'){
      steps{
        script{
          echo "Current branch: ${env.GIT_BRANCH}"
        }
      }
    }
    stage('stage2'){
      steps{
        script{
          echo "Running on agent: ${env.NODE_NAME}"
          sh 'hostname is $(hostname)'
        }
      }
    }
  }
}
