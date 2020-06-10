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
		<h2><font color=yellow>Hello WORLD !!!</font></h2> 
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
		result=`grep "Helloo" index.html | wc -l`
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
            steps {
	     sshPublisher(publishers: [sshPublisherDesc(configName: 'AWS_DEV_SER', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'sudo service apache2 restart', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'index.html')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)]) 
            }
       }
    }
}