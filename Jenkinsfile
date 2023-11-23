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
                sh "cd /var/lib/jenkins/workspace/dock"
                sh "chmod 777 /var/run/docker.sock"
                sh "docker image build -t rr ."
                sh "docker container run -d -P rr"
                sh "docker container ls"
            }
        }
    }
}