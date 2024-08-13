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
                script {
                    // Install python3-venv if missing
                    sh '''
                    sudo apt-get update
                    sudo apt-get install -y python3-venv
                    '''
                    // Create and activate a virtual environment
                    sh '''
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                    '''
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Activate the virtual environment and run tests
                    sh '''
                    . venv/bin/activate
                    pytest
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Activate the virtual environment and deploy
                    sh '''
                    . venv/bin/activate
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
