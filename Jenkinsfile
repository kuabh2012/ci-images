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
    dockerImage = docker build -t my-base-image:${gitCommit} .
  }

  stage('Push image') {
	container('docker') {
    docker.withRegistry('https://registry-1.docker.io/v2/', 'dockerhub') {
      dockerImage.push()
    }
  }
  }
}
}
}

