pipeline{
    agent any
    stages{
        stage ('git') {
            steps{
                git url: "https://github.com/hemachaitanya/argocd-practice.git" ,
                    branch: "main",
                    credentialsId: 'a8818b64-5e39-4398-8cff-25a5e97fcbbf'
            }    
        }
        stage ('docker image'){
            steps {
                sh "cd /var/lib/jenkins/workspace/dockerimage"
                sh "sudo chmod 777 /var/run/docker.sock"
                sh "docker image build -t argo:v1.0 ."
                sh "docker container run -d -P argo:v1.0"
                sh "docker container ls"
                sh "docker --version"
            }
        }
        stage ('cotainer registry'){
            steps{
                withDockerRegistry(credentialsId: 'docker', url: 'https://hub.docker.com/repository/docker/hema789/argocdrepo/general') {
    // some block
            }
        }
     }
        stage('dockerpush'){
            steps{
                sh "docker image tag  argo:v1.0 hema789/argocdrepo:v1.0"
                sh "docker image push hema789/argocdrepo:v1.0"  
            }
        }
    }
}