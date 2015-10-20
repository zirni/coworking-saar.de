require 'haml'
require 'yaml'
require 'ostruct'

template = File.read('layout.haml')

config = YAML.load_file('config.yml')

config = config.map {|c| OpenStruct.new(c)}.group_by(&:city)

style = File.read('screen.css')

haml_engine = Haml::Engine.new(template)

output = haml_engine.render(Object.new, config: config, style: style)

File.open('index.html', 'w+') {|f| f.write(output) }

puts 'built index.html ;-)'
