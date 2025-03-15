#! /bin/bash

# Variables
DOCKER_USERNAME="caramujosan"
DOCKER_REPOSITORY="express_app"
DOCKER_TAG="latest"
REPO_URL="https://github.com/mluukkai/express_app"
LOCAL_REPO_DIR="express_app"

# Check if repo exist, if not, clone repo
if [ ! -d "$LOCAL_REPO_DIR" ]; then
  echo "Cloning the repository..."
  git clone "$REPO_URL" "$LOCAL_REPO_DIR"
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
docker build -t "$DOCKER_USERNAME/$DOCKER_REPOSITORY:$DOCKER_TAG" ./express_app
if [ $? -ne 0 ]; then
  echo "Build failed"
  exit 1
fi

# Push image
echo "Pushing to Docker Hub..."
docker push "$DOCKER_USERNAME/$DOCKER_REPOSITORY:$DOCKER_TAG"
if [ $? -ne 0 ]; then
  echo "Push failed"
  exit 1
fi



