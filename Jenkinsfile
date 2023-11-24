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
                sh "docker image build -t rr:v1.0 ."
                sh "docker container run -d -P rr:v1.0"
                sh "docker container ls"
                sh "docker --version"
            }
        }
        stage ('cotainer registry'){
            steps{
                sh "docker image tag  rr:v1.0 hema789/deploy:v1.0"
                sh "docker image push hema789/deploy:v1.0"  
            }
        }
        stage('kube'){
            steps{
                sh "curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.7/2023-11-14/bin/linux/amd64/kubectl"
                sh "chmod +x ./kubectl"
                sh "mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH"
                sh "kubectl apply -f deploy.yaml"
                sh "kubectl get po"
            }
        }
    }
}