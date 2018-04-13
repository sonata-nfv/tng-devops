#!/usr/bin/env groovy
pipeline {
    agent any
    stages {
      stage('test sp role') {
         steps {
            timestamps {
                sh 'ansible-playbook roles/sp.yml --check --diff -i environments -e "target=localhost"'
            }
         }
      }
      stage('test sdk role') {
         steps {
            timestamps {
                sh 'ansible-playbook roles/sdk.yml --check --diff -i environments -e "target=localhost"'
            }
         }
      }
      stage('test vnv role') {
         steps {
            timestamps {
                sh 'ansible-playbook roles/vnv.yml --check --diff -i environments -e "target=localhost"'
            }
         }
      }
    }
    post {
        success {
            emailext (
              subject: "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
              body: """<p>SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
                <p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
            recipientProviders: [[$class: 'DevelopersRecipientProvider']]
            )
          }
        failure {
          emailext (
              subject: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
              body: """<p>FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
                <p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
              recipientProviders: [[$class: 'DevelopersRecipientProvider']]
            )
        }
    }
}
