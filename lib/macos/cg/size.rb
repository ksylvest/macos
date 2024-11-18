# frozen_string_literal: true

require "ffi"

module MacOS
  module CG
    # https://developer.apple.com/documentation/corefoundation/cgsize
    class Size < FFI::Struct
      layout :width, :double, :height, :double
    end
  end
end
