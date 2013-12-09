require 'fileutils'


task :install do
  script <<-EOF
    cd .. && vagrant destroy
    cd ./vagrant_provision && git reset --hard && git pull && cd $OLDPWD
    cp -vf ./vagrant_provision/Vagrantfile .
  EOF

  system script
end

task :build do
  puts "Building"
end