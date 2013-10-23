module Fluent
  class WildTailInput < TailInput

    Plugin.register_input('wildtail', self)

    def configure(conf)
      conf["path"] = Dir.glob(conf["path"]).join(',')
      super
    end

  end
end
