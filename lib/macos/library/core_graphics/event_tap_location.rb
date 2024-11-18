# frozen_string_literal: true

module MacOS
  module Library
    module CoreGraphics
      # https://developer.apple.com/documentation/coregraphics/cgeventtaplocation
      module EventTapLocation
        HID_EVENT_TAP = 0 # https://developer.apple.com/documentation/coregraphics/cgeventtaplocation/cghideventtap
        SESSSION_EVENT_TAP = 1 # https://developer.apple.com/documentation/coregraphics/cgeventtaplocation/sessioneventtap
        ANNOTATED_SESSION_EVENT_TAP = 2 # https://developer.apple.com/documentation/coregraphics/cgeventtaplocation/annotatedsessioneventtap
      end
    end
  end
end
