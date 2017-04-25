require "spec_helper"
require "serverspec"

package = "argus-clients"

case os[:family]
when "ubuntu"
  package = "argus-client"
when "freebsd"
  package = "net-mgmt/argus3-clients"
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
end

describe command("ra -h") do
  its(:exit_status) { should eq 1 }
  its(:stdout) { should match(/^Ra Version \d+\.\d+\.\d+(?:\d\.)?/) }
  its(:stdout) { should_not match(/^Ra Version 2\.\d+\.\d+(?:\d\.)?/) }
  its(:stderr) { should match(/^$/) }
end
