#!/usr/bin/env groovy

library identifier: 'jenkins-shared-library@main', retriever: modernSCM(
    [$class: 'GitSCMSource',
     remote: 'https://github.com/MennaHamouda/jenkins-shares-library',
     credentialsId: 'gitHub'])
pipeline {
    agent any

    options {
        timestamps()
        disableConcurrentBuilds()
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        // ---- infra branch: provision infrastructure ----
        stage('Infra') {
            when {
                branch 'infrastructure'
            }
            stages {
                stage('Terraform') {
                    steps {
                        script {
                            terraformDeploy()   // init -> validate -> plan -> apply
                        }
                    }
                }
                stage('Ansible') {
                    steps {
                        script {
                            ansibleConfigure()  // configures provisioned hosts
                        }
                    }
                }
            }
        }

        // ---- dev / main(prod) branches: application pipeline ----
        // NOTE: kubernetesDeploy() in the shared library only recognizes
        // env.BRANCH_NAME == 'dev' (-> dev overlay) or 'main' (-> prod overlay).
        // If your prod branch is literally named "prod" instead of "main",
        // either rename the branch to "main" or update
        // vars/kubernetesDeploy.groovy to add a 'prod' case.
        stage('App') {
            when {
                anyOf {
                    branch 'dev'
                    branch 'main'
                }
            }
            stages {
                stage('Install Dependencies') {
                    steps {
                        script {
                            buildNode()      // npm install
                        }
                    }
                }
                stage('Test') {
                    steps {
                        script {
                            test()           // npm test
                        }
                    }
                }
                stage('Docker Build') {
                    steps {
                        script {
                            dockerBuild()    // docker build -t <user>/weather-app:latest .
                        }
                    }
                }
                stage('Docker Push') {
                    steps {
                        script {
                            dockerPush()     // docker login + push
                        }
                    }
                }
                stage('Deploy') {
                    steps {
                        script {
                            kubernetesDeploy() // kubectl diff/apply/get pods (dev|main -> prod)
                        }
                    }
                }
            }
        }
    }

    post {
        always {
            echo "Finished branch '${env.BRANCH_NAME}' with status: ${currentBuild.currentResult}"
        }
    }
}
