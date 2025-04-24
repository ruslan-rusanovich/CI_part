# Simple FastAPI app and CI-pipeline for IBA devops project

On push-request to main branch:
- creates new version of docker image and publishes it to a Docker Hub; 
- makes new commit to CD_part repo with new image version in deployment file;

### Requirements

1. DOCKER_USERNAME and DOCKER_PASSWORD stored as secrets in GitHub secrets
2. Write permissions for GITHUB_TOKEN Workflow permissions in CD_part repo