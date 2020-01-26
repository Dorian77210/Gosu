require './constants'

class Orc

    # Static attributes
    @@IMAGE_PATH = 'orcs.png'
    @@ORC_WIDTH = 96 / 3
    @@ORC_HEIGHT = 130 / 4
    @@V_Y = 45.0
    @@V_X = 45.0
    @@SPEED_RUNNING = 2.0
    @@NORMAL_SPEED = 1.0

    # Attributes
    attr_reader :x, :y
    
    attr_accessor :images, :sprites, :speed

    def initialize (window)
        @images =  Gosu::Image.load_tiles(window, @@IMAGE_PATH, @@ORC_WIDTH, @@ORC_HEIGHT, false)
        @x = @y = 0.0
        @speed = 1.0
        
        @current_image_index = 0.0
        @direction = 'down'
        
        @sprites = {
            'down' => images[0..2],
            'left' => images[3..5],
            'right' => images[6..8],
            'top' => images[9..11]
        }
    end

    def current_image
        @sprites[@direction][@current_image_index.to_i]
    end

    def update_speed (doAccelerate)
        @speed = doAccelerate ? @@SPEED_RUNNING : @@NORMAL_SPEED
    end

    def update_coords (direction, delta)
        @direction = direction
        @current_image_index = (@current_image_index + (delta * 10 * @speed)) % 3
        delta *= @speed

        if direction === 'down'
            @y += @@V_Y * delta if (@y + @@V_Y * delta) < (GameConstants::GAME_HEIGHT - @@ORC_WIDTH)
        elsif direction === 'right'
            @x += @@V_X * delta if (@x + @@V_X * delta) < (GameConstants::GAME_WIDTH - @@ORC_HEIGHT)
        elsif direction === 'left'
            @x -= @@V_X * delta if (@x - @@V_X * delta) > 0 
        elsif direction === 'top'
            @y -= @@V_Y * delta if (@y - @@V_Y * delta) > 0
        end
    end

end