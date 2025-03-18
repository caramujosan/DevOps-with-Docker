#! /bin/sh

set -e

#### REMINDER

## First export user and pswd before running the script in curent terminal instance
## provided that local machine is set up with Docker
#export DOCKER_USERNAME=your_docker_hub_username
#export DOCKER_PASSWORD=your_docker_hub_password


# Variables
DOCKER_USERNAME=${DOCKER_USER}
DOCKER_PASSWORD=${DOCKER_PWD}
#DOCKER_REPOSITORY="express_app"
#DOCKER_TAG="latest"
#REPO_URL="https://github.com/mluukkai/express_app.git"
LOCAL_REPO_DIR="express_app"
REPO_URL=$1
DOCKER_REPOSITORY=$2


if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <repo_url> <docker_repository>"
  exit 1
fi


# Check if repo exist, if not, clone repo
if [ ! -d "$LOCAL_REPO_DIR" ]; then
  echo "Cloning the repository..."
  git clone $1 "$LOCAL_REPO_DIR"
else
  echo "Already cloned. Pulling latest changes..."
  git -C "$LOCAL_REPO_DIR" pull
fi


# Check if the Dockerfile exists
if [ ! -f "express_app/Dockerfile" ]; then
  echo "Dockerfile not found in $PWD"
  exit 1
else
    echo "Dockerfile found"
fi

# # Log in to Docker Hub
echo "Logging in..."
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
if [ $? -ne 0 ]; then
  echo "Login failed"
  exit 1
fi


# Build image
echo "Building image..."
docker build -t $2 ./express_app
if [ $? -ne 0 ]; then
  echo "Build failed"
  exit 1
fi

# Push image
echo "Pushing to Docker Hub..."
docker push $2
if [ $? -ne 0 ]; then
  echo "Push failed"
  exit 1
fi



