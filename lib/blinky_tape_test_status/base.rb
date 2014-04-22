module BlinkyTapeTestStatus
  class Base
    def initialize(options={})
      @tty ||= options[:tty] || best_guess_tty
      raise "No tty specified or discoved" unless @tty
    end

    def blue!
      write! 'sb'
    end

    def color!(color)
      write! color
    end

    def flash!
      write! 'f'
    end

    def pulse!
      write! 'p'
    end

    def quit!
      serial_port.flush
      serial_port.close
      @serial_port = nil
    end

    def rainbow!
      write! 'x'
    end

    def shutdown!
      blue!
      quit!
    end

    def solid!
      write! 's'
    end

    def test_sequence!
      write! 't'
    end

    def write!(*commands)
      commands.each do |command|
        serial_port.puts command
      end
      quit!
    end

    protected
    def best_guess_tty
      if Gem.win_platform?
        best_guess_tty_windows
      else
        Dir.glob "/dev/tty.usbmodem*" do |tty|
          return tty
        end
      end
    end

    def best_guess_tty_windows
      0.upto(10) do |x|
        @tty = x
        begin
          serial_port
          @tty = nil
          return x
        rescue Errno::ENOENT
        end
      end
    end

    def serial_port
      @serial_port ||= SerialPort.new @tty, 9600, 8, 1, SerialPort::NONE
    end

    def valid_port
      return @valid_port if @valid_port
    end
  end
end
