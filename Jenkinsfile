pipeline {
  agent {
     label "K8s-slave" }
  stages {
    stage ('Git clone') {
      steps{
        git credentialsId: 'd462e400-b011-4446-ab8d-a3dcca95d9b6', url: 'https://github.com/Machendra-org/Kubernetes-Topics.git'
      }
    }
    stage ('Build-Image') {
      steps{
        sh 'docker build -t node-app .'
      }
    }
    stage ('Push image to ECR') {
      steps{
        sh ''' docker tag node-app 883195043912.dkr.ecr.us-west-2.amazonaws.com/machihelmrepo:node-app
        aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 883195043912.dkr.ecr.us-west-2.amazonaws.com
        docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/machihelmrepo:node-app
        '''
      }
    }
    /*
    stage ('Deploy image to Helm') {
      steps{
        //sh 'helm create clint-app'
        sh 'helm install machi-clintapp clint-app'
        //sh 'helm upgrade machi-clintapp clint-app'
      }
    }
    */
  }
}
