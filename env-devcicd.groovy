env.DB_URL="hello"
env.DB_URL2="hello2"
//--------------------------------------- Salesforce Org Environment variable
env.SF_CONSUMER_KEY="3MVG9Kip4IKAZQEW8SIBzWoPWNyBHn8lKJuXVntaUke8zaC2caLhEvPrCfv3_SBfKSfLxatZnXeiIJBsuKH9z"
env.SF_USERNAME="chenda.mok@gmail.com.devcicd"
//env.SERVER_KEY_CREDENTIALS_ID="${env.WORKSPACE}/certificates/devhub/server.pass.key"
env.SERVER_KEY_CREDENTIALS_ID='/var/jenkins_home/workspace/salesforce demo org/certificates/devhub/server.key'
env.DEPLOYDIR="src"
env.TEST_LEVEL="RunLocalTests"
env.SF_INSTANCE_URL="https://login.salesforce.com"

// https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ci_jenkins_config_env.htm
// You can also optionally set the SFDX_AUTOUPDATE_DISABLE variable to true to disable auto-update of Salesforce CLI. 
// CLI auto-update can interfere with the execution of a Jenkins job.
env.SFDX_AUTOUPDATE_DISABLE=true
