docker buildx build \
    --cache-from type=registry,ref=vitalysaraevcoherent/mvn-build-cache:latest  \
    --cache-to type=registry,ref=vitalysaraevcoherent/mvn-build-cache:latest \
    -t mvn-demo .

# Testing submodules
