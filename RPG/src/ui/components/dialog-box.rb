require 'gosu'

require './ui/components/component'

class DialogBox < Component

    attr_reader :dialogs, :current_dialog_index, :font, :dialog_coords, :triggers, :trigger_index

    def initialize(parent, image, x, y, id, extra)
        super(parent, image, x, y, id, extra)
        @current_dialog_index = @trigger_index = 0
        @dialogs = extra['dialogs']
        @triggers = extra['triggers']

        @font = Gosu::Font.new(20);

        @dialog_coords = {
            'x' => @x + 40,
            'y' => @y + 30
        }
    end

    def draw
        Component.instance_method(:draw).bind(self).call # call the draw method
        @font.draw_text(self.current_dialog, @dialog_coords['x'], @dialog_coords['y'], 0)
    end

    def current_dialog
        @dialogs[@current_dialog_index]
    end

    def next_dialog
        @current_dialog_index += 1
        current_trigger = @triggers[@trigger_index]
        if current_trigger['dialogIndex'] === @current_dialog_index
            @parent.receive_trigger current_trigger
            @trigger_index += 1 if @trigger_index < @triggers.length - 1
        end
    end

    def first_dialog
        @current_dialog_index = 0
    end

    def has_more_dialogs?
        @current_dialog_index != @dialogs.length - 1
    end

end