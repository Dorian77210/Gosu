require './ui/components/component'

class DialogBox < Component

    attr_reader :dialogs, :current_dialog

    def initialize(image, x, y, id, extra)
        super(image, x, y, id, extra)
        @current_dialog = 0
        @dialogs = extra['dialogs']
    end

end