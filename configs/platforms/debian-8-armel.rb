platform "debian-8-armel" do |plat|
  # Note: This is a community-maintained platform. It is not tested in Puppet's
  # CI pipelines, and does not receive official releases.
  plat.servicedir "/lib/systemd/system"
  plat.defaultdir "/etc/default"
  plat.servicetype "systemd"
  plat.codename "jessie"

  plat.add_build_repository "http://pl-build-tools.delivery.puppetlabs.net/debian/pl-build-tools-release-jessie.deb"
  plat.provision_with "export DEBIAN_FRONTEND=noninteractive; apt-get update ; apt-get install -y --no-install-recommends build-essential devscripts make quilt pkg-config debhelper rsync fakeroot binutils-arm-linux-gnueabi"
  plat.install_build_dependencies_with "DEBIAN_FRONTEND=noninteractive; apt-get install -qy --no-install-recommends "
  plat.vmpooler_template "debian-8-x86_64"
  plat.cross_compiled "true"
  plat.output_dir File.join("deb", plat.get_codename)
end
