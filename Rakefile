require 'fileutils'


task :install do
  system "#{FileUtils.cd(Dir.new('..'))} && vagrant destroy"
  system "#{FileUtils.cd(Dir.new('vagrant_provision'))} && git reset --hard && git pull && cd $OLDPWD"
  system "cp -vf ./vagrant_provision/Vagrantfile ."
end

task :build do
  puts "Building"
end