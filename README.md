# Simple FastAPI app and CI-pipeline for IBA devops project

On push-request to main branch:
- creates new version of docker image and publishes it to a Docker Hub; 
- makes new commit to CD_part repo with new image version in deployment file;

### Requirements

1. DOCKER_USERNAME and DOCKER_PASSWORD stored as secrets in GitHub secrets
2. Personal Access Token (PAT) issued by CD_part repo and stored as CD_PAT secret in GitHub secrets