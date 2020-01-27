require 'gosu'

require './utils/constants'

class ResourceLoader

    def initialize
        
    end

    def self.load_spritesheet(path, tile_width, tile_height, ranges = [0..3, 4..7, 8..11, 12..15])
        images = Gosu::Image.load_tiles(path, tile_width, tile_height)
        sprites = {
            Utils::Direction::DOWN => images[ranges[0]],
            Utils::Direction::LEFT => images[ranges[1]],
            Utils::Direction::RIGHT => images[ranges[2]],
            Utils::Direction::UP => images[ranges[3]]
        }

        # return
        sprites
    end

end