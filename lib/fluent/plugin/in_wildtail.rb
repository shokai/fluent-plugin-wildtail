module Fluent
  class WildTailInput < TailInput

    Plugin.register_input('wildtail', self)

    def configure(conf)
      @_raw_path = conf["path"]
      conf["path"] = Dir.glob(@_raw_path).join(',')
      super
    end

    def start
      res = super
      paths = Dir.glob(@_raw_path).map{|i|
        File.dirname(i)
      }.uniq
      paths.each do |fpath|
        puts fpath
        watcher = Fluent::WildTailInput::Watcher.new File.dirname(fpath)
        @loop.attach watcher
      end
      res
    end

    class Watcher < Cool.io::StatWatcher

      def initialize(path)
        @path = path
        super path, 0.1
      end

      def on_change(previous, current)
        p path
        p previous
        p current
        puts "-"*5
      end

    end

  end
end
