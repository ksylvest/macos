# frozen_string_literal: true

require 'ffi'

module MacOS
  module CG
    # https://developer.apple.com/documentation/corefoundation/cgpoint
    class Point < FFI::Struct
      layout :x, :double, :y, :double

      # @param x [Float]
      # @param y [Float]
      def initialize(x:, y:)
        super()
        self.x = x
        self.y = y
      end

      # @return [Float]
      def x
        self[:x]
      end

      # @return [Float]
      def y
        self[:y]
      end

      # @param value [Float]
      def x=(value)
        self[:x] = value
      end

      # @param value [Float]
      def y=(value)
        self[:y] = value
      end
    end
  end
end
