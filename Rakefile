require 'fileutils'


task :install do
  %( echo $PWD )
  %( cd .. && vagrant destroy )
  %( cd ./vagrant_provision && git reset --hard && git pull && cd $OLDPWD )
  %( cp -vf ./vagrant_provision/Vagrantfile . )
end

task :build do
  puts "Building"
end