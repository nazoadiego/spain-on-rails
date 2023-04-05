module CoreExtensions
  module ConsoleMethods
    def hello_world
      puts 'Hello back to you!'
    end

    def create(...)
      FactoryBot.create(...)
    end

    def build(...)
      FactoryBot.build(...)
    end

    def build_stubbed(...)
      FactoryBot.build_stubbed(...)
    end
  end
end
