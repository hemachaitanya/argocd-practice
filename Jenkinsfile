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
                sh "cd /var/lib/jenkins/workspace/dockerpipeline"
                sh "sudo chmod 777 /var/run/docker.sock"
                sh "docker image build -t rr ."
                sh "docker container run -d -P rr"
                sh "docker container ls"
            }
        }
        stage ('cotainer registry'){
            steps{
                sh "docker image tag  rr hema789/deploy:rr"
                sh "docker image push hema789/deploy:rr"  
            }
        }
    }
}