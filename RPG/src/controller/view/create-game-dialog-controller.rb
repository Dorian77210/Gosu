require './utils/resource-loader'
require './utils/constants'

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
            @create_game_view.components << ResourceLoader.load_component(@create_game_view, component)
        end
    end

    def react_to_event(event_id)
        @create_game_view.components.each do |component|
            if component.collide? @window.mouse_x, @window.mouse_y
                if component.id === Utils::ComponentId::CREATE_GAME_DIALOG_BOX
                    # dialog box with the description text
                    if component.has_more_dialogs?
                        component.next_dialog if component.is_enabled
                    end
                elsif component.id === Utils::ComponentId::NO_CHOICE
                    # reinit the dialogs
                    @create_game_view.dialog_box.first_dialog
                    @create_game_view.display_choices = false
                elsif component.id === Utils::ComponentId::YES_CHOICE
                    puts 'Display the character'
                end
            end
        end
    end

end