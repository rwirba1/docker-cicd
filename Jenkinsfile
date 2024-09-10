pipeline {
    agent {
        label 'slave'  // Ensures the job runs on the Jenkins slave node (build agent)
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/rwirba1/docker-cicd.git'
            }
        }

        stage('Build with Maven') {
            steps {
                // Run Maven build on the slave node
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image using the Dockerfile in the project
                sh 'docker build -t my-app-image:latest .'
            }
        }

        stage('Deploy with Ansible') {
            steps {
                // SSH into EC2 Docker instance via Ansible to deploy and run container
                sshagent(['ec2-ssh-credentials']) {
                    sh '''
                    ansible-playbook -i /inventory.ini deploy-app.yml
                    '''
                }
            }
        }
    }
}
