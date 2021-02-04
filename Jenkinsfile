pipeline {
  options {
    disableConcurrentBuilds()
  }

  agent none

  environment {
    DOCKER_HUB=credentials('www-gateway.docker-hub')
    DOCKER_IMAGE_NAME='europeana/www-gateway'
    DOCKER_IMAGE_TAG="${env.BRANCH_NAME == 'main' ? 'main' : env.BRANCH_NAME.subString(1)}"
  }

  stages {
    stage('Docker image') {
      agent {
        docker {
          image 'docker'
        }
      }
      steps {
        sh 'docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} .'
        sh 'docker login -u ${DOCKER_HUB_USR} -p ${DOCKER_HUB_PSW}'
        sh 'docker push ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}'
      }
    }
  }
}
