require './model/hero'

class GameModel

    attr_reader :hero

    def initialize
        @hero = Hero.new
    end
end