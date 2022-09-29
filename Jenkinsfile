pipeline{
    agent any
    stages{
        stage ('git checkout'){
            steps{
                git 'https://github.com/adhavan27/Unimity-Task.git'
            }
        }
        stage ('sonarqube analysis'){
            steps{
                nodejs(nodeJSInstallationName: 'nodejs15.3.0'){
                 sh "npm install"
                 withSonarQubeEnv('sonar'){
                    sh "npm install sonar-scanner"
                    sh "npm run sonar"
                 }
                }
            }
        }
                stage ("docker image"){
            steps{
                sh "docker build -t adhavan27/sample-node ."
            }
        }
        stage ("docker push"){
            steps{
               withCredentials([string(credentialsId: 'docker', variable: 'dockerpassword')]) {
    // some block
                sh "docker login -u adhavan27 -p ${dockerpassword}"
        }
                sh "docker push adhavan27/sample-node"
            }
        }
        stage ("deployment"){
            steps{
                sh "docker rm -f nodejs"
                sh "docker run -d -p 9981:8080 --name nodejs adhavan27/sample-node"
            }
        }
    }
}
