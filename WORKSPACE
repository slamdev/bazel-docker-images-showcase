workspace(name = "bazel-docker-images-showcase")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

http_archive(
    name = "io_bazel_rules_docker",
    # works without patch unless toolchain_container rule is called
    #    patch_args = ["-p1"],
    #    patches = [
    #        "//:rules_docker_gnu_tar.patch",
    #    ],
    sha256 = "b1e80761a8a8243d03ebca8845e9cc1ba6c82ce7c5179ce2b295cd36f7e394bf",
    strip_prefix = "rules_docker-0.25.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.25.0/rules_docker-v0.25.0.tar.gz"],
)

load("@io_bazel_rules_docker//repositories:repositories.bzl", container_repositories = "repositories")

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load("@io_bazel_rules_docker//container:container.bzl", "container_pull")

container_pull(
    name = "debian-stretch",
    digest = "sha256:05928c5cda32faa00984fb6d5ea565f5e3aed6a006c2a555a8371e4a45e6202a",
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
