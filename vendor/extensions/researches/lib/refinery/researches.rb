require 'refinerycms-core'

module Refinery
  autoload :ResearchesGenerator, 'generators/refinery/researches_generator'

  module Researches
    require 'refinery/researches/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
