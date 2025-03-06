pipeline { 
    agent { label 'Agent_01' }
    environment { 
        AWS_REGION = 'us-east-1'  
        ECR_REPO = '715841331269.dkr.ecr.us-east-1.amazonaws.com/cm-repo:latest' 
    } 
 
    stages { 
        stage('Clone Repository') { 
            steps { 
                git branch: 'main', url: 'https://github.com/Kavyareddy96/java-war-repo.git' 
            } 
        } 
 
        stage('Build Java Application') { 
            steps { 
                sh 'mvn clean package -DskipTests'  
            } 
        } 
 
        stage('Build Docker Image') { 
            steps { 
                sh "sudo docker build -t cm-repo ." 
            } 
        } 
 
        stage('Push Image to AWS ECR') { 
    steps { 
        script { 
             
            sh "aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin 715841331269.dkr.ecr.us-east-1.amazonaws.com" 
            sh "sudo docker tag cm-repo:latest 715841331269.dkr.ecr.us-east-1.amazonaws.com/cm-repo:latest" 
            sh "sudo docker push 715841331269.dkr.ecr.us-east-1.amazonaws.com/cm-repo:latest" 
        } 
    } 
} 
 
    } 
}
