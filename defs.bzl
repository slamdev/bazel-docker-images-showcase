load("@io_bazel_rules_docker//docker/package_managers:download_pkgs.bzl", "download_pkgs")
load("@io_bazel_rules_docker//docker/package_managers:install_pkgs.bzl", _install_pkgs = "install_pkgs")

def install_pkgs(name, packages):
    download_pkgs(
        name = "_{}_download".format(name),
        image_tar = "@debian-stretch//image",
        packages = packages,
    )
    _install_pkgs(
        name = name,
        image_tar = "@debian-stretch//image",
        installables_tar = ":_{}_download.tar".format(name),
        installation_cleanup_commands = "rm -rf /var/lib/apt/lists/*",
        output_image_name = name,
    )
