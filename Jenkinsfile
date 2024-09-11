pipeline {
    agent {
        label 'slave'  // Ensures the job runs on the Jenkins slave node (build agent)
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Pull the code from GitHub on the Jenkins slave node
                git branch: 'main', url: 'https://github.com/rwirba1/docker-cicd.git'
            }
        }

        stage('Build with Maven') {
            steps {
                // Run Maven build on the slave node (Maven should be installed here)
                sh 'mvn clean package'
            }
        }

        stage('Deploy with Ansible') {
            steps {
                // Use Ansible to SSH into the EC2 Docker server to build and run the Docker container
                // sshagent(['slave-ssh-key']) {
                    sh '''
                    ansible-playbook -i /home/ubuntu/workspace/app-build/inventory.ini deploy-app.yml
                    '''
                
            }
        }
    }
}
