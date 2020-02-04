class AbstractView

    attr_reader :components

    def initialize
        @components = []
    end

    # must be override
    def draw
        @components.each do |component|
            component.draw
        end
    end

    # must be override
    def react_to_mouse

    end

    # must be override
    def react_to_event(event_id)

    end

    # must be override
    def receive_trigger(trigger)

    end
end