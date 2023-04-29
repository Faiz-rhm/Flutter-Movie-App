def buildApp() {
    echo 'Building app...'
}

def doctor() {
    sh "fluter doctor -v"
}

def testingApp() {
    sh "flutter test"
}

def deployingApp() {
    echo 'Deploying app...'
    sh "flutter build apk --split-per-abi"
}

def clean() {
    sh "flutter clean"
}

return this