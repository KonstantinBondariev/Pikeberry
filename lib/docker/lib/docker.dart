abstract interface class Docker {
  /// Authenticate to a registry
  /// [password] Password or Personal Access Token (PAT)
  /// [username] Username
  /// [server] Servier url
  /// https://docs.docker.com/reference/cli/docker/login/
  Future<String> login({
    required String server,
    String? password,
    String? username,
  });

  /// Description	Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  /// Usage	docker image tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
  /// [HOST[:PORT]/]NAMESPACE/REPOSITORY[:TAG]
  /// https://docs.docker.com/reference/cli/docker/image/tag/
  Future<String> imageTag({
    required String sourceImage,
    required String targetImage,
  });

  /// Upload an image to a registry
  /// [server] Servier url
  /// [imageName] Image NAME[:TAG]
  /// https://docs.docker.com/reference/cli/docker/image/push/
  Future<String> imagePush({required String server, required String imageName});

  /// Start a build
  /// [path] Path to dockerfile
  /// https://docs.docker.com/reference/cli/docker/buildx/build/
  Future<String> build({String? path, String? tag});
}
