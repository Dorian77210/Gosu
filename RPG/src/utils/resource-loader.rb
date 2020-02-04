require 'gosu'
require 'json'

require './utils/constants'
require './ui/components/component'
require './ui/components/dialog-box'

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

    # Load a graphical component
    def self.load_component(parent, json)
        # load the image
        path = json['path']
        image = Gosu::Image.new path
        clazz = Object.const_get(json['type'])
        component = clazz.new(parent, image, json['x'].to_f, json['y'].to_f, json['id'], json['extra'])
        component
    end

    def self.load_json_file(path)
        stream = File.open path
        json = JSON.parse(stream.read)
        json
    end

end