#! groovy

timestamps {
	stage ("Collect information") {
		node('master') {
		echo env.WORKSPACE
		sh('printenv | sort')
		}
	}
}
