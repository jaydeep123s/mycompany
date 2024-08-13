pipeline {
    agent any

    environment {
        APP_NAME = 'my-webserver'
        REPO_URL = 'https://github.com/jaydeep123s/mycompany.git'
        BRANCH_NAME = 'main'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: "${REPO_URL}", branch: "${BRANCH_NAME}"
            }
        }

        stage('Setup') {
            steps {
                // Install dependencies using apt
                sh 'sudo apt-get update'
                sh 'sudo apt-get install -y python3-pip'
                // Install Python dependencies
                sh 'pip3 install -r requirements.txt'
            }
        }

        stage('Test') {
            steps {
                sh 'pytest'
            }
        }

        stage('Deploy') {
            steps {
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

    post {
        always {
            echo 'Cleaning up...'
        }
    }
}
