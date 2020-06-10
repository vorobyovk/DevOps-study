pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "--------------Build started---------------"
		sh '''
		cat <<EOF > index.html
		<html>
		<body bgcolor=blue>
		<center>
		<h2><font color=yellow>Hello WORLD!</font></h2> 
		</center> 
		</body>
		</html>
		EOF
		'''
		echo "---------------Build end-------------------"
            }
        }
        stage('Test') {
            steps {
                echo "--------------Test begin-------------"
		sh '''
		result=`grep "Hello" index.html | wc -l`
		echo $result
		if [ "$result" = "1" ]
		then
		echo "Test passed"
		else
		echo "Test failure"
		exit 1
		fi 
		'''	
		echo "--------------Test end---------------"
            }
        }
        stage('Deploy') {
            script {
	     sshPublisher(
  	     continueOnError: false, failOnError: true,
	     publishers: [
	      sshPublisherDesc(
	       configName: "AWS_DEV_SER",
	       verbose: true,
    	       transfers: [
		sshTransfer(
	 	 sourceFiles: "index.html",
	         removePrefix: "",
	         remoteDirectory: "",
	         execCommand: "sudo service apache2 restart"
	        )
               ])
             ])
            }
       }
    }
}