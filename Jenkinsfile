// Global Variable goes here
// Pipeline block
pipeline {
   // Agent block
   agent { node { label 'Manage_Contact_Demo'}}
options {
      buildDiscarder(logRotator(numToKeepStr: '30'))
      timestamps()
   }
   
   stage('Push to Dockerhub') {
     when { 
       equals 
          expected: "true", 
          actual: '${params.PushImage}' }
     steps {
       script {
         echo 'Pushing the image to docker hub'
         def localImage = '${params.lamp:latest}:${params.2966e540ac1a6983be9b4e5bda48d97a8265a409dbe1181375d39af0eafd44de}'
      
         // samira is my username in the DockerHub
         // You can use your username
         def repositoryName = 'samira1/lamp:latest'
      
         // Create a tag that going to push into DockerHub
         sh "docker tag ${localImage} ${samira1/lamp:latest} "
         docker.withRegistry('', 'samira1/lamp:latest') {
           def image = docker.image('${samira1/lamp:latest}');
           image.push()
         }
       }
    }
  }
}
