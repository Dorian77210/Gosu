require 'gosu'

require './utils/constants'

require './ui/view/home-view'
require './ui/view/create-game-view'

class GameWindow < Gosu::Window

    attr_reader :input_controller, :game_state, :current_view

    def initialize
        super Utils::WINDOW_WIDTH, Utils::WINDOW_HEIGHT
        self.caption = 'RPG'

        # default game view
        @game_state = Utils::GameState::HOME
        @current_view = HomeView.new self

    end

    # update method, the logic of the game
    # @Override
    def update
        # close the window, maybe do some stuff
        close if button_down? Gosu::KB_ESCAPE

        @current_view.react_to_mouse
    end

    # draw method, the display of assets
    # @Override
    def draw
        @current_view.draw
    end

    # @Override
    def needs_cursor?
        true
    end

    def change_game_state (state, params = nil)
        @game_state = state

        if @game_state === Utils::GameState::CREATE_GAME
            @current_view = CreateGameView.new self
        end
    end

end