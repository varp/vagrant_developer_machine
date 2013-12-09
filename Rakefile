require 'bundler'

ENV['DEVELOPER_MACHINE_ROOT'] = Dir.getwd
ENV['DEVELOPER_MACHINE_PROVISION_BOOTSTRAP'] = 'vagant_machine.sh'

task :install do
  script = <<-EOF
    cd .. && vagrant destroy
    cd ./vagrant_provision && git reset --hard && git pull
    cp -vf ./Vagrantfile ..
  EOF

  system script

  # TODO: change CWD of parent process (bash|shell) to vagrant_devel_machine directory
end

task :build do
  puts "Building"
end