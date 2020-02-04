require './controller/view/create-game-dialog-controller'
require './ui/view/abstract-view'

class CreateGameView < AbstractView

    @@DISPLAY_COMPONENTS_TRIGGER = "DisplayComponents"

    attr_reader :dialog_controller, :components
    attr_accessor :display_choices

    def initialize(window)
        super()
        @dialog_controller = CreateGameDialogController.new self, window
        @display_choices = false
    end

    # @Override
    def draw
        # draw the dialog box
        self.dialog_box.draw
        if display_choices
            @components[1..3].each do |component|
                component.draw
            end
        end
    end

    # @Override
    def react_to_event(event_id)
        @dialog_controller.react_to_event event_id
    end

    # @Override
    def receive_trigger(trigger)
        trigger_type = trigger['type']
        if trigger_type === @@DISPLAY_COMPONENTS_TRIGGER
            # display the components
            @display_choices = true
        end
    end

    # get the dialog box of the current view
    def dialog_box
        @components[0]
    end

end