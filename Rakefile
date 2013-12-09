task :install do
  system "cd .. && vagrant destroy"
  system "cd ../vagrant_provision && git reset --hard && git pull && cd #{ENV['OLDPWD']}"
  system 'cp -vf vagrant_provision/Vagrantfile .' 
end

task :build do
  puts "Building"
end