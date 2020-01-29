def label = "worker-${UUID.randomUUID().toString()}"

podTemplate(label: label, containers: [
  containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true)
],
volumes: [
  hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
]) 
{
node {
    def app
 
	
    stage('Clone-repository') {
      container('docker') {
        checkout scm
      }
    }

    stage('Build image') {
	  container('docker')
        app = docker.build("kuabh2012/ci-image")
    }


    stage('Push image') {
	  container('docker')
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
	
  }
}
