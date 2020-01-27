require './utils/resource-loader'

class CreateGameDialogController

    @@CREATE_GAME_VIEW_PATH = "./../rsc/view/create-game-view.json"

    attr_reader :create_game_view, :window

    def initialize(create_game_view, window)
        @create_game_view = create_game_view
        @window = window

        json = ResourceLoader.load_json_file @@CREATE_GAME_VIEW_PATH
        config = json['config']
        components = config['components']
        components.each do |component|
            @create_game_view.components << ResourceLoader.load_component(component)
        end
    end

end