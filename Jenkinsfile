@Library('jenkins_shared_lib') _

pipeline{
    agent any
    stages{
        stage('Git Checkout'){
            steps{
                script{

                    gitCheckout(
                        branch: "main"
                        url: "https://github.com/AdvanceCodeMarshall/mrdevops_java_app.git"
                    )
                }
            }
        }
    }
}