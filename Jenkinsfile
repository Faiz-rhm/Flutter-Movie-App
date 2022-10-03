pipeline {
    agent any
    // enviroment {
    //     NEW_VERSION = '3.3.3',
    //     SERVER_CREDENTIALS = credentials('server-credentials')
    // }
    // tools{
    //     maven 'Maven'
    //     gradle 'Gradle'
    // }
    parameters {
        // string(name: 'VERSION', defaultValue: '3.3.3', description: 'The version of the plugin to be used for')
        choice(name: 'VERSION', choice: ['3.3.3', '3.2.0'], description: 'The version of the plugin to be used for')
        booleanParam(name: 'executeTests', defaultValue: true, description: 'The version of the plugin to be used for')
    }

    stages {
        stage('BUILD') {
            // when {
            //     expressions {
            //         BRANCH_NAME = 'QA' || BRANCH_NAME = 'dev'
            //     }
            // }
            steps {
                echo 'Building the app'
                // echo "New version ${NEW_VERSION} is"
                // sh "mvn install"
                // sh "gradle install"
            }
        }

        stage('TEST') {
            when {
                expressions {
                    params.executeTests
                }
            }
            steps {
                echo 'Testing the app'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the app'
                echo "Deploying version ${params.VERSION} is"
                // withCredentials([
                //     usernamePassword(credentials: 'server-credentials', usernameVariable: USER, passwordVariable: PWD)
                // ]){
                //     sh "some script ${USER} and ${PWD} are"
                // }

            }
        }
    }
}
