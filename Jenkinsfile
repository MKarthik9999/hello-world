@Library('Java-application-Shared-Library')_
pipeline {
    agent any

    stages {
        stage('cloning Git Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/MKarthik9999/hello-world.git'
            }
        }
        stage('Compiling the code got from repository'){
            steps {
                echo "compiling the source code"
                helloWorld("compile")
            }
        }
        stage('Generating the war file by building the application'){
            steps {
                echo "Generating the war file"
                helloWorld("package")
            }
        }
        stage('Deploying the war file into the Tomcat Server'){
            steps {
                echo "Deploying it to the Server"
                deploy adapters: [tomcat9(credentialsId: 'admin', path: '', url: "${env.tomcat_url}")], contextPath: 'Hello-World', war: '**/*.war'
            }
        }
    }
    post {
        always {
            // Send email notification
            mail to: 'showrykarthik@gmail.com',
                 subject: "${currentBuild.result}",
                 body: """Project: ${env.JOB_NAME}<br/>
                          Build Number: ${env.BUILD_NUMBER}<br/>
                          URL: ${env.BUILD_URL}""",
                 bcc: '',
                 cc: '',
                 from: '',
                 replyTo: ''
        }
    }
}

