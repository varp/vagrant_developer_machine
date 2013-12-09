require 'bundler'


task :install do
  script = <<-EOF
    cd .. && vagrant destroy
    cd ./vagrant_provision && git reset --hard && git pull && cd $OLDPWD
    cp -vf ./vagrant_provision/Vagrantfile .
  EOF

  system script

  # TODO: change CWD of parent process (bash|shell) to vagrant_devel_machine directory
  %[eval $(ruby -e'puts "cd #{ENV['OLDPWD']}"')]
end

task :build do
  puts "Building"
end