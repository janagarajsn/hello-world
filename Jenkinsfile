pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M2_HOME" and add it to the path.
        maven "M2_HOME"
    }

    stages {
        stage('Checkout') {
            steps {
                // Get some code from a GitHub repository
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/janagarajsn/hello-world.git']]])

            }
        }
        stage('Build') {
            steps {
                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean install package"

            }
        }
        stage('Build Docker Image') {
            steps {
               script {
                   sh "docker build -t janagarajs/helloworld-image ."
               }               

            }
        }
        stage('Create container and Publish Image') {
			parallel {
				stage('Create container') {
					steps {
						sh "docker run -d -p 8081:8080 janagarajs/helloworld-image"
					}
				}
				stage('Publish image') {
					steps {
						withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
							sh "docker login -u janagarajs -p ${dockerhubpwd}"
						}
						sh "docker push janagarajs/helloworld-image"
					}
				}
			}
        }
    }
}
