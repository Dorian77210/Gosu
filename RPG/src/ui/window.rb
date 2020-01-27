require 'gosu'

require './utils/constants'
require './model/game-model'
require './controller/input-controller'

class GameWindow < Gosu::Window

    attr_reader :game_model
    attr_reader :input_controller

    def initialize
        super Utils::WINDOW_WIDTH, Utils::WINDOW_HEIGHT
        self.caption = 'RPG'

        # game model that load the hero
        @game_model = GameModel.new
        @input_controller = InputController.new @game_model, self
    end

    # update method, the logic of the game
    def update
        # close the window, maybe do some stuff
        close if button_down? Gosu::KB_ESCAPE

        # input controller part
        @input_controller.react_to_input

    end

    # draw method, the display of assets
    def draw
        draw_rect(0, 0, Utils::WINDOW_WIDTH, Utils::WINDOW_HEIGHT, Gosu::Color.argb(0xff_00ffff))
        @game_model.hero.draw
    end

end