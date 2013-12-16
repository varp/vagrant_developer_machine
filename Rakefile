require 'bundler'
require 'rake'
require 'yaml'
require 'erb'

# require 'ruby-debug/debugger'

BUILD_DIR = "."
ERB_DIR = "./erb"
VAGRANT_MACHINE_PROVISION = "vagrant_machine.sh"
VAGRANT_MACHINE_CONFIGURE = "vagrant_machine_configure.sh"
VAGRANTFILE = "Vagrantfile"

class Helpers

  @@config = nil

  def self.interpolate_component(component)
    module_name = component.split("/")[-1]

    if component.split("/").include? "configs"
      if module_name == "*"
        configs_args = []
        Dir.glob("./configs/**") do |filename|
          configs_args.push(filename.split("/")[-1]) if File.directory?(filename)
        end
        return "configs/configs.sh #{configs_args.join(' ')}"
      else
        return "configs/configs.sh #{module_name}"
      end
    end

    if module_name == "*"
      interpolated_files = []
      Dir.glob(File.join(component.split("/")[0...-1], "*.sh")) do |filename|
        interpolated_files.push filename
      end
      interpolated_files
    else
      module_name += ".sh"
      File.join(component.split("/")[0...-1], module_name)
    end
  end

  def self.load_config
    @@config = YAML.load_file("config.yml")
  end

  def self.prioritories_modules(component_name, modules)
    priorities = @@config['priorities']['components'][component_name]
    sorted = [], unsorted = []
    modules.each do |item|
      module_name = item.to_s.split("/")[-1].split(".")[0]
      pr = priorities && priorities.index(module_name)
      index = modules.index item
      sorted.insert(pr, item) if pr
      sorted.push item unless pr
    end
    sorted.reject { |item| item.nil? }
  end

  def self.order_by_components_first(components)
    components_order = @@config['priorities']['order']
    comp_modules = []
    sorted = []

    components_order.each do |com_order|
      components.each do |com|
        comp_modules.push com if com.match /.*#{com_order}.*/
      end
      comp_modules = prioritories_modules(com_order, comp_modules)
      sorted.push comp_modules.dup
      comp_modules.clear
    end

    sorted.flatten!
  end

  def self.prioritorize(components)
    sorted_by_components = order_by_components_first(components)
  end

end

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

  vagratfile_template = File.open("#{ERB_DIR}/#{VAGRANTFILE}.erb", "r") do |f|
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
    f.write ERB.new(vagratfile_template, 0, '', "vagrantfile_out").result b
  end

  File.open(vm_conf, "w") do |f|
    f.write ERB.new(configure_template, 0, '', "machine_configure_out").result b
  end


  File.chmod(0755, vm_out)
  File.chmod(0755, vf_out)
  File.chmod(0755, vm_conf)
end


task :build do
  system 'vagrant reload --provision'
end

task :run do
  # system "vagrant up"
  system "vagrant reload --no-provision"
end

task :configure do
  priv_key = '/cygdrive/c/HashiCorp/Vagrant/embedded/gems/gems/vagrant-1.3.5/keys/vagrant'
  system "ssh -2 -i #{priv_key} vagrant@localhost -p 2222 'sudo /vagrant/#{VAGRANT_MACHINE_CONFIGURE}'"
end


task :default do
  # DEFAULT_COMPONENTS = 'deps/* system/* gui/xfce gui/ubuntu_fonts devtools/git devtools/sublime3 devtools/vim devtools/languages/* devtools/languages/python/* devtools/languages/ruby/* configs/locales'
  DEFAULT_COMPONENTS = 'deps/hostname deps/repo_yandex deps/user system/* devtools/git devtools/vim configs/locales'
  Rake::Task[:clean].invoke
  Rake::Task[:install].invoke
  Rake::Task[:gen].invoke(DEFAULT_COMPONENTS)
  Rake::Task[:build].invoke
  Rake::Task[:run].invoke
  Rake::Task[:configure].invoke
end