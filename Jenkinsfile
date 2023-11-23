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
                sh """
                  cd argocd-practice
                  docker imaage build -t rr .
                  docker container run -d -P rr
                  """
            }
        }
    }
}