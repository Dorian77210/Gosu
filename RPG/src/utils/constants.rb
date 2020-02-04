module Utils
    # Window constants
    WINDOW_WIDTH = 600
    WINDOW_HEIGHT = 600

    # Hero constants
    HERO_PATH_SPRITESHEET = './../assets/images/perso-spritesheet.png'
    HERO_SPRITESHEET_WIDTH = 128
    HERO_SPRITESHEET_HEIGHT = 194
    HERO_WIDTH = HERO_SPRITESHEET_WIDTH / 4
    HERO_HEIGHT = HERO_SPRITESHEET_HEIGHT / 4
    HERO_IMAGE_PER_LINE = 4
    HERO_VY = 45.0
    HERO_VX = 45.0

    # keyboard config
    KEYBOARD_CONFIG = './../rsc/keyboard.json'

    # Direction enumeration
    module Direction
        UP = 'up'
        DOWN = 'down'
        RIGHT = 'right'
        LEFT = 'left'
    end

    # Game state enumeration
    module GameState
        HOME = 'HOME',
        CREATE_GAME = 'CREATE_GAME'
    end

    module ComponentId
        # Create Game view
        CREATE_GAME = 'CreateGame'
        CREATE_GAME_DIALOG_BOX = "CreateGameDialogBox"
        CREATE_GAME_YES_CHOICE = "CreateGameYesChoice"
        CREATE_GAME_NO_CHOICE = "CreateGameNoChoice"

        YES_CHOICE = "YesChoice"
        NO_CHOICE = "NoChoice"
    end
end