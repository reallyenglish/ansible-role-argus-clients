require "spec_helper"
require "serverspec"

package = "argus-clients"
config_dir = "/etc"
default_group = "root"
default_user = "root"

case os[:family]
when "ubuntu"
  package = "argus-client"
when "freebsd"
  package = "net-mgmt/argus3-clients"
  config_dir = "/usr/local/etc"
  default_group = "wheel"
when "openbsd"
  default_group = "wheel"
end

describe package(package) do
  it { should be_installed }
end

case os[:family]
when "freebsd"
  describe file("/usr/lib/sasl2") do
    it { should be_symlink }
    it { should be_linked_to "/usr/local/lib/sasl2" }
  end
  describe file("/etc/ra.conf") do
    it { should be_symlink }
    it { should be_linked_to "/usr/local/etc/ra.conf" }
  end
end

describe command("ra -h") do
  its(:exit_status) { should eq 1 }
  its(:stdout) { should match(/^Ra Version \d+\.\d+\.\d+(?:\d\.)?/) }
  its(:stdout) { should_not match(/^Ra Version 2\.\d+\.\d+(?:\d\.)?/) }
  its(:stderr) { should match(/^$/) }
end

describe file("#{config_dir}/ra.conf") do
  it { should be_file }
  it { should be_owned_by default_user }
  it { should be_grouped_into default_group }
  it { should be_mode 644 }
  its(:content) { should match(/^RA_MIN_SSF=40$/) }
  its(:content) { should match(/^RA_MAX_SSF=128$/) }
end
