@Library('my-shared-library') _
// this way we import the library
pipeline {
    agent any
    parameters{
        choice(name: 'action', choices: 'create\ndestroy', description: 'create or destroy')
    }
    stages {
        when { expression { params.action == 'create' } }
        stage('Git Checkout'){
            steps {
                gitCheckout(
                    branch: "master",
                    url: "https://github.com/formycore/java_techie_jar_shared_proj.git"
                )
            }
        }
        // Unit Test
        stage('Unit Test Maven'){
        when { expression { params.action == 'create' } }
            steps {
                script {
                    mvnTest()
                }
            }
        }
        // Integration Test
        stage ('Integration Tets'){
        when { expression { params.action == 'create' } }
            steps {
                script {
                    mvnIntegrationtest()
            }
            }
        }
    }
}