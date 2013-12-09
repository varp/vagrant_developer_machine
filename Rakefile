task :install do
  system "#{Dir.chdir(Dir.new('..'))} && vagrant destroy"
  system "#{Dir.chdir('vagrant_provision')} && git reset --hard && git pull && #{Dir.chdir(Dir.new('..'))}"
  system 'cp -vf vagrant_provision/Vagrantfile .' 
end

task :build do
  puts "Building"
end