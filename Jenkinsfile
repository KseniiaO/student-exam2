pipeline{
    environment{
        registry = 'kseniiaob/exam'
        registryCredential = '9b733255-f420-4aa7-943b-0a3161b80fc8'
        dockerImage2 = ''
    }
    agent any
    stages{
        stage('Clone Git repo'){
            steps{
                git 'https://github.com/KseniiaO/student-exam2'
            }
        }
        stage('Run Python tests'){
            steps{
                sh 'cd  /home/jenkins/workspace/ci_web_app'
                sh 'pip install -e \'.[test]\''
                sh 'coverage run -m pytest'
                sh 'coverage report'
            }
        }
        stage('Build Docker image'){
            steps{
                script{
                    dockerImage = docker.build registry + ":app"
                }
            }
        }
        stage('Push Docker image'){
            steps{
                script{
                    docker.withRegistry('', registryCredential){
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Clean up'){
            steps{
                sh 'docker rmi $registry:app'
            }
        }
    }
}
