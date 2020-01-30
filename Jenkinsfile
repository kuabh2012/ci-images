def label = "worker-${UUID.randomUUID().toString()}"

podTemplate(label: label, containers: [
  containerTemplate(name: 'gradle', image: 'gradle:4.5.1-jdk9', command: 'cat', ttyEnabled: true),
  containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true)
],
volumes: [
  hostPathVolume(mountPath: '/home/gradle/.gradle', hostPath: '/tmp/jenkins/.gradle'),
  hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
]) {
  node(label) {
  checkout scm
  def dockerImage

  stage('Build image') {
	container('docker') {
    dockerImage = docker.build("username/repository:tag")
  }

  stage('Push image') {
	container('docker') {
    withDockerRegistry([ credentialsId: "dockerhub", url: "https://hub.docker.com/u/kuabh2012" ]) {
      dockerImage.push()
    }
  }
  }
}
}
}
