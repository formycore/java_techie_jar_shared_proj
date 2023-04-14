@Library('my-shared-library') _
// this way we import the library
pipeline {
    agent any
    parameters{
        choice(name: 'action', choices: 'create\ndestroy', description: 'create or destroy')
    }
    stages {
        
        stage('Git Checkout'){
            when { expression { params.action == 'create' } }
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
        stage ('Static Code Analysis') {
        when { expression { params.action == 'create' } }
        steps {
            script {
                def SonarQubeCred = 'sonarsecret'
                staticCodeAnalysis(SonarQubeCred)
            }
        }
        }
        stage('Quality Gate Analysis'){
        when { expression { params.action == 'create' } }
        steps {
            script {
                def SonarQubeCred = 'sonarsecret'
                qualityGatesAnalysis(SonarQubeCred)
            }
        }
        }
        stage('Maven Build'){
            when { expression { params.action == 'create' } }
            steps {
                script {
                    mvnBuild()
                }
            }
        }
    }
}