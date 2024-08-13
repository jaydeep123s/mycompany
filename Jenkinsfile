
pipeline {
    agent any

    environment {
        APP_NAME = 'my-webserver'
        REPO_URL = 'https://github.com/jaydeep123s/mycompany.git'
        BRANCH_NAME = 'main'
    }

    stages {
        stage('Setup') {
            steps {
                script {
                    sh '''
                    sudo apt-get update
                    sudo apt-get install -y python3-pip
                    '''
                }
            }
        }

        stage('Checkout') {
            steps {
                git url: "${REPO_URL}", branch: "${BRANCH_NAME}"
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'pip3 install -r requirements.txt'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    sh 'pytest'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh '''
                    ssh -i ~/.ssh/your-key.pem ubuntu@52.39.241.79 << EOF
                    cd /path/to/deploy
                    git pull origin ${BRANCH_NAME}
                    sudo systemctl restart nginx
                    EOF
                    '''
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
        }
    }
}
