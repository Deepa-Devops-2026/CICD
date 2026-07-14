pipeline {

    agent any

    tools {
        jdk 'Java21'
        maven 'Maven3'
    }

    environment {
        VM_IP = "20.219.125.69"
        VM_USER = "azureuser"
        APP_NAME = "devops-e2e-app"
        TOMCAT_WEBAPPS = "/var/lib/tomcat9/webapps"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps { 
                dir('devops-e2e-app') {
                sh 'mvn clean compile'
                }
            }
        }

        stage('Test') {
            steps {
                dir('devops-e2e-app'){
                sh 'mvn test'
            }
        }
        }
        stage('Package') {
            steps {
                dir('devops-e2e-app') {
                sh 'mvn clean package'
            }
        } 
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'devops-e2e-app/target/*.war', fingerprint: true
            }
        }

        stage('Configure VM') {
            steps {
                dir('Ansible') {
                    sh '''
                        ansible-playbook -i inventory.ini playbooks/deploy.yml
                    '''
                }
            }
        }

        stage('Deploy WAR') {
            steps {
                sh """
                scp -i /home/deepa/.ssh/id_rsa \
                    -o StrictHostKeyChecking=no \
                    devops-e2e-app/target/${APP_NAME}.war \
                    ${VM_USER}@${VM_IP}:/tmp/

                ssh -i /home/deepa/.ssh/id_rsa \
                    -o StrictHostKeyChecking=no \
                    ${VM_USER}@${VM_IP} "
                    sudo cp /tmp/${APP_NAME} ${TOMCAT_WEBAPPS}/
                    sudo systemctl restart tomcat9
                "
                """
            }
        }

        stage('Health Check') {
            steps {
                sh """
                    sleep 20
                    curl http://${VM_IP}:8080/devops-e2e-app/
                """
            }
        }

    }

    post {

        always {
            cleanWs()
        }

        success {
            echo 'Pipeline completed successfully.'
        }

        failure {
            echo 'Pipeline failed.'
        }

    }
}
