# Fluent::Plugin::Wildtail

wildcard enabled tail input plugin for fluentd.

## Installation

    $ fluent-gem install fluent-plugin-wildtail

## Usage

```
<source>
  type wildtail
  path /path/to/logs/*/*.log
  tag test.debug
  format /^(?<log>.*)$/
</source>
```

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
