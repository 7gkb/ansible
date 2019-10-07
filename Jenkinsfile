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
				checkout([$class: 'GitSCM',
                    branches: [[name: "master"]],
                    skipDefaultCheckout: true,
                    extensions: [[$class: 'CloneOption', timeout: 240]],
					//extensions: [[$class: 'hudson.plugins.git.extensions.impl.CheckoutOption', timeout: 60]],
					extensions: [[$class: 'CheckoutOption', timeout: 100]],
					// extensions: [[$class: 'LocalBranch', localBranch: "master"]],
					extensions: [[$class: 'SubmoduleOption',
                        disableSubmodules: false,
                        parentCredentials: true,
						recursiveSubmodules: true,
                        // reference: 'git remote add SubProject1 git@gitlab.intapp.com:Products/Walls/testplatform.git',
                        // parentCredentials: 'SSH_KEY',
                        timeout: 120,
                        trackingSubmodules: false]],
					    // submoduleCfg: [url: 'git remote add SubProject1 git@gitlab.intapp.com:Products/Walls/testplatform.git'],
                    // extensions: [[$class: 'checkoutOptions', timeout: 6000]],
                    gitTool: 'Default', 
                    userRemoteConfigs: [[credentialsId: 'eduard-at-070556190622', url: 'https://git-codecommit.us-east-1.amazonaws.com/v1/repos/ansible']]
                    // userRemoteConfigs: [[credentialsId: '4ac41fd0-3ef9-4094-a562-a80866b9f90a', url: 'https://gitlab.intapp.com/Products/Walls/walls.git']]
                ])
			}
		}
	}
}
