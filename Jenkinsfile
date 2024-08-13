pipeline {
    agent any

    environment {
        // Define any environment variables here
        APP_NAME = 'my-webserver'
        REPO_URL = 'https://github.com/jaydeep123s/mycompany.git'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub
                git url: "${REPO_URL}"
            }
        }

        stage('Build') {
            steps {
                // Build the webserver application (e.g., for Python, you might install dependencies)
                script {
                    sh 'pip install -r requirements.txt'
                }
            }
        }

        stage('Test') {
            steps {
                // Run tests
                script {
                    sh 'pytest'
                }
            }
        }

        stage('Deploy') {
            steps {
                // Deploy the application to the EC2 instance
                script {
                    sh '''
                    ssh -i ~/.ssh/taTA.pem ubuntu@<EC2_PUBLIC_IP> << EOF
                    cd /path/to/deploy
                    git pull origin main
                    sudo systemctl restart nginx
                    EOF
                    '''
                }
            }
        }
    }

    post {
        always {
            // Archive artifacts or perform cleanup
            echo 'Cleaning up...'
        }
    }
}
