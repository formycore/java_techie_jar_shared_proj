@Library('my-shared-library') _
// this way we import the library
pipeline {
    agent any
    parameters{
        choice(name: 'action', choices: 'create\ndestroy', description: 'create or destroy')
        string(name: 'ImageName', description:'Name of th docker image', defaultValue:'javaapp')
        string(name:'Imagetag', description:'Docker build tag', defaultValue: 'v1')
        //string(name:'Appname', description:'Name of the application', defaultValue: 'springboot')
        string(name:'DockerHubUser', description:'Docker User id', defaultValue: 'formycore')
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
        // stage('Unit Test Maven'){
        // when { expression { params.action == 'create' } }
        //     steps {
        //         script {
        //             mvnTest()
        //         }
        //     }
        // }
        // // Integration Test
        // stage ('Integration Tets'){
        // when { expression { params.action == 'create' } }
        //     steps {
        //         script {
        //             mvnIntegrationtest()
        //     }
        //     }
        // }
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
        stage('Docker Build'){
            when { expression { params.action == 'create' } }
            steps {
                script {
                    dockerBuild("${params.ImageName}","${params.Imagetag}","${params.DockerHubUser}")
                }
            }
        }
        stage ('Docker scan: Trivy'){
            when { expression { params.action == 'create' } }
            steps{
                script{
                    dockerImageScan("${params.ImageName}","${params.Imagetag}","${params.DockerHubUser}")
                }
            }
        }
        stage ('Docker Push '){
            when { expression { params.action == 'create' } }
            steps {
                script {
                    dockerPush("${params.ImageName}","${params.Imagetag}","${params.DockerHubUser}")
                }
            }
        }
        stage ('Docker Images clean'){
            when { expression { params.action == 'create' } }
            steps {
                script {
                    dockerClean("${params.ImageName}","${params.Imagetag}","${params.DockerHubUser}")
                }
            }
        }
    }
}