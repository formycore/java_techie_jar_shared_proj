@Library('my-shared-library') _
// this way we import the library
pipeline {
    agent any
    stages {
        stage('Git Checkout'){
            steps {
                gitCheckout(
                    branch: "master"
                    url: "https://github.com/formycore/java_techie_jar_shared_proj.git"
                    
                )
            }
        }
    }
}