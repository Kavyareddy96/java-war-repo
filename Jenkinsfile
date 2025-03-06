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
             
            sh "aws ecr get-login-password --region ${AWS_REGION} | sudo docker login -username AWS --password-stdin ${ECR_REPO}" 
            sh "sudo docker tag cm-repo:latest ${ECR_REPO}:latest" 
            sh "sudo docker push ${ECR_REPO}:latest" 
        } 
    } 
} 
 
    } 
}
