require 'rubygems'
require 'rake'
require 'erb'

require 'lib/helpers'


BUILD_DIR = "."
ERB_DIR = "./erb"
VAGRANT_MACHINE_PROVISION = "vagrant_machine.sh"
VAGRANT_MACHINE_CONFIGURE = "vagrant_machine_configure.sh"
VAGRANTFILE = "Vagrantfile"

task :clean do
  script = <<-EOF
    vagrant destroy
    unlink ./Vagrantfile
  EOF

  system script
end

task :init do
  script = <<-EOF
    vagrant init precise32 http://files.vagrantup.com/precise32.box
  EOF

  system script
end



task :gen, [:components] do |t, args|

  Helpers.load_config
  com = []
  components = args.components.split /\s+/
  components.each do |c|
    com.push Helpers.interpolate_component(c)
  end

  ## Allways append dependicies
  COMPONENTS = Helpers.prioritorize com.flatten!


  provision_template = File.open("#{ERB_DIR}/#{VAGRANT_MACHINE_PROVISION}.erb", "r") do |f|
    f.read
  end

  configure_template = File.open("#{ERB_DIR}/#{VAGRANT_MACHINE_CONFIGURE}.erb", "r") do |f|
    f.read
  end

  vagrantfile_template = File.open("#{ERB_DIR}/#{VAGRANTFILE}.erb", "r") do |f|
    f.read
  end 

  Dir.mkdir_p(BUILD_DIR) unless Dir.exists? BUILD_DIR

  vm_out = File.join(BUILD_DIR, VAGRANT_MACHINE_PROVISION)
  vm_conf = File.join(BUILD_DIR, VAGRANT_MACHINE_CONFIGURE)
  vf_out = File.join(BUILD_DIR, VAGRANTFILE)

  b = binding
  # puts b

  provision_out = ""

  File.open(vm_out, "w") do |f|
      ERB.new(provision_template, 0, '', "provision_out").result b
      provision_out.gsub!(/^\s+/, "")
      f.puts provision_out
  end

  File.open(vf_out, "w") do |f|
    f.write ERB.new(vagrantfile_template, 0, '', "vagrantfile_out").result b
  end

  File.open(vm_conf, "w") do |f|
    f.write ERB.new(configure_template, 0, '', "machine_configure_out").result b
  end


  File.chmod(0755, vm_out)
  File.chmod(0755, vf_out)
  File.chmod(0755, vm_conf)
end


task :build do
  system "vagrant up --provision"
end

task :reload do
  system "vagrant reload --no-provision"
end

task :configure do
  # priv_key = '/cygdrive/c/HashiCorp/Vagrant/embedded/gems/gems/vagrant-1.3.5/keys/vagrant'
  # system "ssh -2 -i #{priv_key} vagrant@localhost -p 2222 'sudo /vagrant/#{VAGRANT_MACHINE_CONFIGURE}'"
end


task :default do
  DEFAULT_COMPONENTS = 'system/hostname system/repo_yandex system/user deps/* devtools/git devtools/vim configs/locales'
  Rake::Task[:clean].invoke
  Rake::Task[:init].invoke
  Rake::Task[:gen].invoke(DEFAULT_COMPONENTS)
  Rake::Task[:build].invoke
  Rake::Task[:reload].invoke
  Rake::Task[:configure].invoke
end