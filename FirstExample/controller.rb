require 'gosu'

module Controller

    class InputController

        attr_reader :orc

        def initialize (orc)
            @orc = orc

            # time for the update loop
            @last_time = Process.clock_gettime(Process::CLOCK_REALTIME, :microsecond)
        end

        def update(window)
            current_time = Process.clock_gettime(Process::CLOCK_REALTIME, :microsecond)
            delta = current_time - @last_time
            @last_time = current_time

            if window.button_down? Gosu::KB_DOWN
                @orc.update_coords 'down', delta / 1_000_000.0
            end
            if window.button_down? Gosu::KB_RIGHT
                @orc.update_coords 'right', delta / 1_000_000.0
            end
            if window.button_down? Gosu::KB_LEFT
                @orc.update_coords 'left', delta / 1_000_000.0
            end
            if window.button_down? Gosu::KB_UP
                @orc.update_coords 'top', delta / 1_000_000.0
            end

            # update the speed of the orc
            @orc.update_speed window.button_down?(Gosu::KB_SPACE)
        end
    end
end