# frozen_string_literal: true

module MacOS
  # Simulates a macOS keyboard.
  class Keyboard
    def type(text)
      text.chars.each do |character|
        key_down(character)
        key_up(character)
      end
    end
  end
end
