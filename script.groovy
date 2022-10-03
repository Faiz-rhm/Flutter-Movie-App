def buildApp() {
    echo "Building app...";
}

def testingApp() {
    echo "Testing app...";
    sh 'flutter text'
}

def deployingApp() {
    echo "Deploying app...";
    sh 'flutter build apk'
}

return this