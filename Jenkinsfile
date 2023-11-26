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
                sh "docker image build -t babool:$BUILD_ID ."
                sh "docker container run -d -P babool:$BUILD_ID"
                sh "docker image ls"
                sh "docker container ls"
                sh "docker --version"
            }
        }
        stage('dockerpush'){
            steps{
                sh "docker image tag babool:$BUILD_ID hema789/argocdrepo:$BUILD_ID"
                sh "docker image push hema789/argocdrepo:$BUILD_ID"  
            }
        }
    }
}