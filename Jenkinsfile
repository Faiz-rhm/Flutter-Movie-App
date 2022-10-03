// def gv

pipeline {
    agent any
    // enviroment {
        // NEW_VERSION = '3.3.3',
        // SERVER_CREDENTIALS = credentials('server-credentials')
    // }
    // tools{
    //     maven 'Maven'
    //     gradle 'Gradle'
    // }
    parameters {
        // string(name: 'VERSION', defaultValue: '3.3.3', description: 'The version of the plugin to be used for')
        choice(name: 'VERSION', choices: ['3.3.3', '3.2.0'], description: 'The version of the plugin to be used for')
        booleanParam(name: 'executeTests', defaultValue: true, description: 'The version of the plugin to be used for')
    }

    stages {
        // stage ('INIT') {
        //     steps {
                // script {
                //     gv = load "script.groovy"
                // }
        //     }
        // }

        stage ('Fluttre Doctor') {
            steps {
                sh "fluter doctor -v"
                // script {
                //     gv.doctor()
                // }
            }
        }


        stage('TEST') {
            when {
                expression {
                    params.executeTests
                }
            }
            steps {
                sh "flutter test"
                // script{
                //     gv.testingApp()
                // }

                // echo 'Testing the app'
            }
        }

        stage('BUILD') {
            // when {
            //     expressions {
            //         BRANCH_NAME = 'QA' || BRANCH_NAME = 'dev'
            //     }
            // }
            steps {
                sh "flutter build apk --split-per-abi"
                // echo 'Building the app'
                // echo "New version ${NEW_VERSION} is"
                // sh "mvn install"
                // sh "gradle install"
                // script {
                //     gv.buildApp()
                // }
            }
        }

        // stage('Deploy') {
        //     steps {
                // script {
                //     gv.deployingApp()
                // }
                // echo 'Deploying the app'
                // echo "Deploying version ${params.VERSION} is"
                // withCredentials([
                //     usernamePassword(credentials: 'server-credentials', usernameVariable: USER, passwordVariable: PWD)
                // ]){
                //     sh "some script ${USER} and ${PWD} are"
                // }

        //     }
        // }

        stage ('Fluttre Clean') {
            steps {
                sh "flutter clean"

                // script {
                //     gv.clean()
                // }
            }
        }
    }
}
