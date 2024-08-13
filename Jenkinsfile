pipeline {
    agent any

    environment {
        APP_NAME = 'my-webserver'
        REPO_URL = 'https://github.com/jaydeep123s/mycompany.git'
        BRANCH_NAME = 'main' // Update this to the correct branch
    }

    stages {
        stage('Checkout') {
            steps {
                git url: "${REPO_URL}", branch: "${BRANCH_NAME}"
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'pip install -r requirements.txt'
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
                    ssh -i ~/.ssh/myname.pem ubuntu@52.39.241.79 << EOF
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
