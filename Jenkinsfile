def dockerImage;

node('docker'){
	stage('SCM'){
		checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/cyru8/docker-image-meta-build.git']]]); 
		// https://github.com/FeynmanFan/JenkinsDocker
	}
	stage('build agent-dotnetcore'){
		dockerImage = docker.build('oadetiba/agentdotnetcore:v$BUILD_NUMBER', './dotnetcore');
	}
	stage('build mavenjavacore'){
		dockerImage = docker.build('oadetiba/agentmavenjavacore:v$BUILD_NUMBER', './mavenjavacore');
	}
	stage('build nodejscoreagent'){
		dockerImage = docker.build('oadetiba/agentnodejscore:v$BUILD_NUMBER', './nodejscoreagent');
	}
	stage('build pythoncore'){
		dockerImage = docker.build('oadetiba/agentpythoncore:v$BUILD_NUMBER', './pythoncore');
	}
	stage('push'){
		docker.withRegistry('https://index.docker.io/v1/', 'dockerhubcreds'){
			dockerImage.push();
		}
	}
}