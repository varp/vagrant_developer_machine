require 'fileutils'


task :install do
  %( #{FileUtils.cd(Dir.new('..'))} && vagrant destroy )
  %( #{FileUtils.cd(Dir.new('vagrant_provision'))} && git reset --hard && git pull && cd $OLDPWD )
  %( cp -vf ./vagrant_provision/Vagrantfile . )
end

task :build do
  puts "Building"
end