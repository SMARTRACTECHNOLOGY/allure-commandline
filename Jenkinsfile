

def repository = "smartcosmos/allure-commandline"

node {
    checkout scm

    def commitID = sh(returnStdout: true, script: "git rev-parse HEAD")
    def tag = commitID.trim().take(6)
    def image

    try {
      stage ('build'){
        image = docker.build "${repository}:${tag}"
      }
      if (env.BRANCH_NAME == 'master') {
        stage ('publish') {

          docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
            image.push()
            image.push('latest')
          }
        }
      }
    }
    finally {
      // remove image to save space
      sh "docker rmi ${image.id}"
    }
}
