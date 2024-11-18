# frozen_string_literal: true

require "ffi"

module MacOS
  module CG
    # https://developer.apple.com/documentation/corefoundation/cgrect
    class Rect < FFI::Struct
      layout :origin, MacOS::CG::Point, :size, MacOS::CG::Size
    end
  end
end
