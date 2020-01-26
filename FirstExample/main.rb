require 'gosu'
require 'json'


# local imports
require './constants'
require './orc'
require './character'
require './controller'

class GameWindow < Gosu::Window

    ESC_KEY = 41

    attr_reader :input_controller

    def initialize
        super GameConstants::GAME_WIDTH, GameConstants::GAME_HEIGHT
        self.caption = 'Test'
        @orc = Orc.new self
        @characters = []

        # load the characters
        stream = File.open('characters.json')
        json = JSON.parse(stream.read)

        json['characters'].each do |character|
            @characters << Character.new(self, character)
        end

        # controller for the orc
        @input_controller = Controller::InputController.new @orc
    end

    # Update method
    def update
        @input_controller.update self
    end

    # Draw method
    def draw
        @orc.current_image.draw(@orc.x, @orc.y, 0)
        @characters.each do |character|
            character.image.draw(character.x, character.y, 0)
        end
    end

    # Button down
    def button_down (event)
        self.close if event == ESC_KEY
    end

end

GameWindow.new.show