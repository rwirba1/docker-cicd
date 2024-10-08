pipeline {
    agent {
        label 'slave-node'  // Ensures the job runs on the Jenkins slave node (build agent)
    }
    environment {
        M2_HOME = '/opt/maven'
        PATH = "$M2_HOME/bin:$PATH"
        JAVA_HOME = '/usr/lib/jvm/java-17-openjdk-amd64'
    }    

    stages {
        stage('Clean Workspace') {
            steps {
                // Clean up the workspace before starting the job
                cleanWs()  // Jenkins workspace cleanup plugin function
            }
        }

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
                    ansible-playbook -i /home/ubuntu/workspace/${JOB_NAME}/inventory.ini deploy-app.yml --extra-vars "jenkins_job_name=${JOB_NAME}"
                    '''
                
            }
        }
    }
}
