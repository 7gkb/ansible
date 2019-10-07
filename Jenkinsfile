#! groovy

timestamps {
	stage ("Collect information") {
		node('master') {
		echo ${WORKSPACE}
		sh('printenv | sort')
		}
	}
}