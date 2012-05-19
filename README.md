# Confrider

Configuration managment system with i18n like syntax

## Installation

Add this line to your application's Gemfile:

    gem 'confrider'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install confrider

## Usage

little helper(to render yaml files with ERB)

    require "erb"
    require "yaml"
    def load_yml(yml_path)
        YAML.load(ERB.new(File.read(yml_path)).result(binding))
    end
    #
    # where settings.yml may contain ERB code

    # contents /path/to/settings.yml

    # app:
    #   name: some app name
    #   version: <%= File.read('VERSION') %>
    #   subnamespace:
    #     another_key: value

    $cfg = Confrider.from_hash(load_yml('/path/to/settings.yml'))
    $cfg['app.name'] # => 'some app name'
    $cfg['app.version'] # will be rendered through ERB
    $cfg['app.subnamespace'] # => {'another_key' => 'value'}
    $cfg['app.subnamespace.another_key'] # => 'value'
    $cfg['non.existent.key'] # => nil
    $cfg['non.existent.key', 'default'] # => 'default'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
 
