# frozen_string_literal: true

module MacOS
  module Library
    module CoreGraphics
      # https://developer.apple.com/documentation/coregraphics/cgeventflags
      module EventFlags
        MASK_SHIFT = 0x00020000 # https://developer.apple.com/documentation/coregraphics/cgeventflags/maskshift
        MASK_CONTROL = 0x00040000 # https://developer.apple.com/documentation/coregraphics/cgeventflags/maskcontrol
        MASK_ALTERNATE = 0x00080000 # https://developer.apple.com/documentation/coregraphics/cgeventflags/maskalternate
        MASK_COMMAND = 0x00100000 # https://developer.apple.com/documentation/coregraphics/cgeventflags/maskcommand
        MASK_HELP = 0x00400000 # https://developer.apple.com/documentation/coregraphics/cgeventflags/maskhelp

        MAPPING = {
          "shift" => MASK_SHIFT,
          "control" => MASK_CONTROL,
          "ctrl" => MASK_CONTROL,
          "option" => MASK_ALTERNATE,
          "opt" => MASK_ALTERNATE,
          "alt" => MASK_ALTERNATE,
          "command" => MASK_COMMAND,
          "cmd" => MASK_COMMAND,
          "help" => MASK_HELP,
        }.freeze

        # @param modifier [String]
        #
        # @raise [ArgumentError]
        #
        # @return [Integer]
        def self.find(modifier)
          MAPPING[modifier] || raise(ArgumentError, "unsupported modifier=#{modifier.inspect}")
        end
      end
    end
  end
end
