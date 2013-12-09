require 'bundler'
require 'rake'
require 'erb'
    
BUILD_DIR = "."
ERB_DIR = "./erb"
VAGRANT_MACHINE_PROVISION = "vagrant_machine.sh"
VAGRANTFILE = "Vagrantfile"

task :clean do
  script = <<-EOF
    vagrant destroy
    unlink ./Vagrantfile
  EOF

  system script
end

task :install do
  script = <<-EOF
    vagrant init precise32 http://files.vagrantup.com/precise32.box
  EOF

  system script
end

task :build do
  
  provision_template = File.open("#{ERB_DIR}/#{VAGRANT_MACHINE_PROVISION}.erb", "r") do |f|
    f.read
  end

  vagratfile_template = File.open("#{ERB_DIR}/#{VAGRANTFILE}.erb", "r") do |f|
    f.read
  end 

  Dir.mkdir_p(BUILD_DIR) unless Dir.exists? BUILD_DIR

  vm_out = File.join(BUILD_DIR, VAGRANT_MACHINE_PROVISION)
  vf_out = File.join(BUILD_DIR, VAGRANTFILE)

  File.open(vm_out, "w") do |f|
      f.puts ERB.new(provision_template, 0, "", "provision_out").result
  end

  File.open(vf_out, "w") do |f|
    f.puts ERB.new(vagratfile_template, 0, "", "vagratfile_out").result
  end


  File.chmod(0755, vm_out)
  File.chmod(0755, vf_out)
end

task :default do
  Rake::Task[:clean].invoke
  Rake::Task[:install].invoke
  Rake::Task[:build].invoke
end