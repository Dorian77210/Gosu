require './controller/view/create-game-dialog-controller'

class CreateGameView

    attr_reader :dialog_controller, :components

    def initialize(window)
        @components = []
        @dialog_controller = CreateGameDialogController.new self, window 
    end

    def draw
        @components.each do |component|
            component.draw
        end
    end

    def react_to_mouse
        # do nothing for the moment
    end

end