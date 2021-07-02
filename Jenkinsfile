def dockerImage;

node('docker'){
	stage('SCM'){
		checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/cyru8/docker-image-meta-build.git']]]); 
		// https://github.com/FeynmanFan/JenkinsDocker
	}
	stage('Verify Branch') {
        //  steps {
    	echo "${env.GIT_BRANCH}"
        slackSend message: "Started:- Jenkins Docker Slave-Agent Started. - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL} | Link>)"
        // }
    }
	stage('build agent-dotnetcore image'){
		dockerImage = docker.build('oadetiba/agentdotnetcore:v$BUILD_NUMBER', './dotnetcore');
	}
	stage('push agent-dotnetcore image'){
		docker.withRegistry('https://index.docker.io/v1/', 'dockerhubcreds'){
			dockerImage.push();
		}
	}
	stage('build mavenjavacore image'){
		dockerImage = docker.build('oadetiba/agentmavenjavacore:v$BUILD_NUMBER', './mavenjavacore');
	}
	stage('push mavenjavacore image'){
		docker.withRegistry('https://index.docker.io/v1/', 'dockerhubcreds'){
			dockerImage.push();
		}
	}
	stage('build nodejscoreagent image'){
		dockerImage = docker.build('oadetiba/agentnodejscore:v$BUILD_NUMBER', './nodejscoreagent');
	}
	stage('push nodejscoreagent image'){
		docker.withRegistry('https://index.docker.io/v1/', 'dockerhubcreds'){
			dockerImage.push();
		}
	}
	stage('build pythoncore image'){
		dockerImage = docker.build('oadetiba/agentpythoncore:v$BUILD_NUMBER', './pythoncore');
	}
	stage('push pythoncore image'){
		docker.withRegistry('https://index.docker.io/v1/', 'dockerhubcreds'){
			dockerImage.push();
		slackSend message: "Completed:- Jenkins Docker Slave-Agent successfully built and pushed to docker registry. - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL} | Link>)"
		}
	}
}