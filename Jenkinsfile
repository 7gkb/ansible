#! groovy

timestamps {
	stage ("Collect information") {
		node('master') {
			stage ('Collect_') {
				echo env.WORKSPACE
				sh('printenv | sort')
			}
			stage ('GIT') {
				echo "test git"
			}
		}
	}
}
