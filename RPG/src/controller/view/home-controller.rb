require './utils/resource-loader'
require './utils/constants'

class HomeController

    @@HOME_VIEW_PATH = "./../rsc/view/home-view.json"

    attr_reader :home_view, :window

    def initialize(home_view, window)
        @home_view = home_view
        @window = window

        json = ResourceLoader.load_json_file @@HOME_VIEW_PATH
        config = json['config']
        components = config['components']
        components.each do |component|
            @home_view.components << ResourceLoader.load_component(@home_view, component)
        end
    end

    def react_to_mouse
        # the mouse button is pressed
        if @window.button_down? Gosu::MsLeft
            @home_view.components.each do |component|
                if component.collide? @window.mouse_x, @window.mouse_y
                    if component.id === Utils::ComponentId::CREATE_GAME
                        @window.change_game_state Utils::GameState::CREATE_GAME
                    end
                end
            end
        end
    end
end