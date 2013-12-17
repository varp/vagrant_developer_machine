require 'yaml'


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

  def self.load_config(filename="config.yml")
    @@config = YAML.load_file(filename)
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