module BlinkyTapeTestStatus
  class Base
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
    end

    protected
    def serial_port
      @serial_port ||= SerialPort.new '/dev/ttyACM0', 9600, 8, 1, SerialPort::NONE
    end

    def valid_port
      return @valid_port if @valid_port
    end
  end
end
