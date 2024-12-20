pipeline {
    agent any

    stages {
        stage('Git Clone') {
            steps {
                // Clone the Git repository test1adsadfsdadasadsjhgljgij
                git branch: 'main',
                    url: 'https://github.com/animesh88891/test-repo.git',
                    credentialsId: 'test-jenkins'
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                script {
                    // Validate the Terraform configuration files
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Generate the Terraform execution plan
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Approve Plan') {
            steps {
                script {
                    // Wait for manual approval before applying
                    input message: 'Do you want to apply the Terraform plan?', ok: 'Apply'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Apply the Terraform plan
                    sh 'terraform apply tfplan'
                }
            }
        }
    }

    post {
        always {
            // Clean up any artifacts like the plan filetest
            sh 'rm -f tfplan'
        }
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs for errors.'
        }
    }
}
