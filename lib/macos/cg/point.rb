# frozen_string_literal: true

require "ffi"

module MacOS
  module CG
    # https://developer.apple.com/documentation/corefoundation/cgpoint
    class Point < FFI::Struct
      layout :x, :double, :y, :double
    end
  end
end
