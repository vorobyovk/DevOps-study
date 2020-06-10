pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "--------------Build started---------------"
		cat <<EOF > index.html
		<html>
		<body bgcolor=black>
		<center>
		<h2><font color=white>Hello WORLD!</font></h2> 
		</center> 
		</body>
		</html>
		EOF
		echo "---------------Build end-------------------"
            }
        }
        stage('Test') {
            steps {
                echo "--------------Test begin-------------"
		result=`grep "Hello" index.html | wc -l`
		echo $result
		if [ "$result" = "1" ]
		then
		echo "Test passed"
		else
		echo "Test failure"
		exit 1
		fi 
		echo "--------------Test end---------------"
            }
        }
        stage('Deploy') {
            steps {
                echo "--------------Deployment begin-------------"
		ls -la
            }
        }
    }
}