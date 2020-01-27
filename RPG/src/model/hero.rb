require 'gosu'

require './utils/constants'
require './utils/resource-loader'

class Hero

    attr_reader :sprites
    attr_accessor :x, :y, :direction

    def initialize
        # load the images of the spritesheet
        @sprites = ResourceLoader.load_spritesheet(Utils::HERO_PATH_SPRITESHEET, Utils::HERO_WIDTH, Utils::HERO_HEIGHT)
        @current_image_index = 0.0
        @x = @y = 0.0
        
        # default direction
        @direction = Utils::Direction::DOWN
    end

    # Get the current representation of the hero
    def current_image
        @sprites[@direction][@current_image_index.to_i]
    end

    # draw the hero on the screen
    def draw
        current_image.draw @x, @y, 0
    end

    def update_coords(direction, delta)
        @direction = direction
        @current_image_index = (@current_image_index + (delta * 10)) % Utils::HERO_IMAGE_PER_LINE

        if @direction === Utils::Direction::DOWN
            @y += Utils::HERO_VY * delta if (@y + Utils::HERO_VY * delta) < (Utils::WINDOW_HEIGHT - Utils::HERO_HEIGHT)
        elsif @direction === Utils::Direction::UP
            @y -= Utils::HERO_VY * delta if (@y - Utils::HERO_VY * delta) > 0
        elsif @direction === Utils::Direction::RIGHT
            @x += Utils::HERO_VX * delta if (@x + Utils::HERO_VX * delta) < (Utils::WINDOW_WIDTH - Utils::HERO_WIDTH)
        elsif @direction === Utils::Direction::LEFT
            @x -= Utils::HERO_VX * delta if (@x - Utils::HERO_VX * delta) > 0
        end
    end
    

    # private section
    private
        attr_accessor :current_image_index

end