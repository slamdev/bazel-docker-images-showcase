workspace(name = "bazel-docker-images-showcase")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

http_archive(
    name = "io_bazel_rules_docker",
    # works without patch unless toolchain_container rule is called
    #    patch_args = ["-p1"],
    #    patches = [
    #        "//:rules_docker_gnu_tar.patch",
    #    ],
    sha256 = "59536e6ae64359b716ba9c46c39183403b01eabfbd57578e84398b4829ca499a",
    strip_prefix = "rules_docker-0.22.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.22.0/rules_docker-v0.22.0.tar.gz"],
)

load("@io_bazel_rules_docker//repositories:repositories.bzl", container_repositories = "repositories")

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load("@io_bazel_rules_docker//container:container.bzl", "container_pull")

container_pull(
    name = "debian-stretch",
    digest = "sha256:c5cd3ffceeb25b683bf5111ea89bf8049a177e00fb237235d48076a19cc80097",
    registry = "index.docker.io",
    repository = "debian",
    tag = "9.13-slim",
)

http_file(
    name = "temurin_jdk_17",
    downloaded_file_path = "jdk.tar.gz",
    sha256 = "288f34e3ba8a4838605636485d0365ce23e57d5f2f68997ac4c2e4c01967cd48",
    urls = ["https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.2%2B8/OpenJDK17U-jdk_x64_linux_hotspot_17.0.2_8.tar.gz"],
)
