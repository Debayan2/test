pipeline {
    agent any

    triggers {
        githubPullRequest()
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                echo 'Building...'
                // Add your build steps here
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                // Run test commands (e.g., `mvn test`, `npm test`)
            }
        }
        stage('Lint') {
            steps {
                echo 'Running Linter...'
                // Example: `eslint .` or `flake8 .`
            }
        }
    }
    post {
        always {
            echo 'PR check completed.'
        }
    }
}
  
