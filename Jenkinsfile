@Library('my-shared-library@main') _
pipeline{
    agent any
    
    parameters{
        choice(name: 'action', choices: 'create\ndelete', description:'Choose Create/Destroy')
        string(name: 'ImageName', description: "Name of the docer build", defaultValue: 'javapp')
        string(name: 'ImageTag', description: "Tag of the docer build", defaultValue: 'v1')
        string(name: 'DokerHubUser', description: "User Name for dockerhub user", defaultValue: 'mgmbcssantosh86')
    }

    stages{

        stage('Git Checkout'){
            when { expression { params.action == 'create' } }
            steps{
                gitCheckout(
                    branch: "main",
                    url: "https://github.com/AdvanceCodeMarshall/mrdevops_java_app.git"
                )
            }
        }
        stage('Unit Test maven'){
            when { expression { params.action == 'create' } }
            steps{
                script{
                    mvnTest()
                }
            }
        }
        stage('Integeration Test maven'){
            when { expression { params.action == 'create' } }
            steps{
                script{
                    mvnIntegerationTest()
                }
            }
        }
        stage('Static Code Analysis : Sonarqube'){
            when { expression { params.action == 'create' } }
            steps{
                script{
                    def SonarQubecredentialsId = 'sonarqube-api'
                    staticCodeAnalysis(SonarQubecredentialsId)
                }
            }
        }
        stage('Quality Gate Status Check : Sonarqube'){
            when { expression { params.action == 'create' } }
            steps{
                script{
                    def SonarQubecredentialsId = 'sonarqube-api'
                    qualityGateStatus(SonarQubecredentialsId)
                }
            }
        }
        stage('Maven Build : maven'){
            when { expression { params.action == 'create' } }
            steps{
                script{
                    mvnBuild()
                }
            }
        }
        stage('Docker Image Build'){
            when { expression { params.action == 'create' } }
            steps{
                script{
                    dockerBuild("${params.ImageName}","${params.ImageTag}","${params.DokerHubUser}")
                }
            }
        }
        stage('Docker Image Scan: Trivy'){
            when { expression { params.action == 'create' } }
            steps{
                script{
                    dockerImageScan("${params.ImageName}","${params.ImageTag}","${params.DokerHubUser}")
                }
            }
        }
        stage('Docker Image Push: Docker hub'){
            when { expression { params.action == 'create' } }
            steps{
                script{
                    dockerImagePush("${params.ImageName}","${params.ImageTag}","${params.DokerHubUser}")
                }
            }
        }
        // stage('Docker Image Cleanup: Docker hub'){
        //     when { expression { params.action == 'create' } }
        //     steps{
        //         script{
        //             dockerImageCleanup("${params.ImageName}","${params.ImageTag}","${params.DokerHubUser}")
        //         }
        //     }
        // }
    }
}