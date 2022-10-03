pipeline {
    agent any
    parameters {
        choice(name: 'VERSION', choice: ['3.3.3', '3.2.0'], description: 'The version of the plugin to be used for')
        booleanParam(name: 'executeTests', defaultValue: true, description: 'The version of the plugin to be used for')
    }
    stages {
        stage('BUILD') {
            steps {
                echo 'Building the app'
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

            }
        }
    }
}
