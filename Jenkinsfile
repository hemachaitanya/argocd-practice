pipeline{
    agent any
    stages{
        stage ('git') {
            steps{
                git url: "https://github.com/hemachaitanya/argocd-practice.git" ,
                    branch: "main"
            }    
        }
        stage ('docker image'){
            steps {
                sh "docker container ls -f $(docker container ls -a -q)"
                sh "docker image ls -f $(docker image ls -a -q)"
                sh "cd /var/lib/jenkins/workspace/dockerpipeline"
                sh "sudo chmod 777 /var/run/docker.sock"
                sh "docker image build -t rr:v1.0 ."
                sh "docker container run -d -P rr:v1.0"
                sh "docker container ls"
            }
        }
        stage ('cotainer registry'){
            steps{
                sh "docker image tag  rr:v1.0 hema789/deploy:v1.0"
                sh "docker image push hema789/deploy:v1.0"  
            }
        }
    }
}