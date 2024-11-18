# frozen_string_literal: true

require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect 'macos' => 'MacOS'
loader.setup

module MacOS
  class Error < StandardError; end

  # @return [MacOS::Screen]
  def screen
    Screen.new
  end
end
