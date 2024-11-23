pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'sojuya/kibana' // Docker Hub 이미지 이름
    }

    stages {
        stage('Checkout') {
            steps {
                // GitHub 리포지토리에서 코드 체크아웃
                git 'https://github.com/songguru/test.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Docker 이미지를 빌드
                    docker.build("${DOCKER_IMAGE}:${env.BUILD_ID}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Docker Hub에 이미지를 푸시
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-credentials') {
                        docker.image("${DOCKER_IMAGE}:${env.BUILD_ID}").push()
                    }
                }
            }
        }
    }
}

