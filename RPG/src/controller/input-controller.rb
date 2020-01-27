require 'gosu'
require 'json'

require './utils/constants'

class InputController

    attr_reader :game_model
    attr_reader :keyboard_config

    def initialize(game_model, window)
        @game_model = game_model
        @window = window
        @keyboard_config = {}

        # load the keyboard config
        stream = File.open Utils::KEYBOARD_CONFIG
        json = JSON.parse stream.read

        # bindings the keyboard with Gosu constants
        json['keyboard'].each do |action, key|
            @keyboard_config[action] = Gosu.char_to_button_id key
        end

        # time
        @last_time = Process.clock_gettime(Process::CLOCK_REALTIME, :microsecond)
    end

    def react_to_input
        # retrieve the delta time between each calling of the function
        current_time = Process.clock_gettime(Process::CLOCK_REALTIME, :microsecond)
        delta = (current_time - @last_time) / 1_000_000.0

        # update the last time
        @last_time = current_time
        
        # input for the moving of the hero
        if @window.button_down? @keyboard_config[Utils::Direction::DOWN]
            @game_model.hero.update_coords Utils::Direction::DOWN, delta
        end

        if @window.button_down? @keyboard_config[Utils::Direction::UP]
            @game_model.hero.update_coords Utils::Direction::UP, delta
        end

        if @window.button_down? @keyboard_config[Utils::Direction::RIGHT]
            @game_model.hero.update_coords Utils::Direction::RIGHT, delta
        end

        if @window.button_down? @keyboard_config[Utils::Direction::LEFT]
            @game_model.hero.update_coords Utils::Direction::LEFT, delta
        end
    end
end