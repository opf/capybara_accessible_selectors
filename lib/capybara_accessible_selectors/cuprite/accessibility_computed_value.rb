# frozen_string_literal: true

module CapybaraAccessibleSelectors
  module Cuprite
    class AccessibilityComputedValue
      def self.resolve(...)
        new(...).resolve
      end

      def initialize(node, name)
        @node = node
        @name = name
      end

      # @name is one of "name"/"description"/"role", matching the
      # Ferrum::Accessibility::AXNode reader of the same name. Degrades to
      # nil on a missing AX node or a CDP/node error, mirroring the
      # Selenium path's rescue behaviour.
      def resolve
        axnode = @node.node.axnode
        axnode&.public_send(@name)
      rescue ::Ferrum::Error
        nil
      end
    end
  end
end
