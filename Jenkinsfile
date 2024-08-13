pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    def app = docker.build("my-webapp")
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Test Docker image
                    sh 'docker run --rm my-webapp python -m unittest discover'
                }
            }
        }
        stage('Deploy to EC2') {
            steps {
                script {
                    // Push Docker image to Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials-id') {
                        app.push('latest')
                    }
                    
                    // SSH to EC2 and deploy
                    sh '''
                        ssh -i /path/to/your/key.pem ec2-user@your-ec2-public-ip "docker pull my-webapp:latest && docker run -d -p 80:80 my-webapp:latest"
                    '''
                }
            }
        }
    }
}
