class Character

    attr_reader :x, :y, :text, :image

    def initialize (window, json)
        @x = json['x']
        @y = json['y']
        @image = Gosu::Image.load_tiles(window, json['imagePath'], 96 / 3, 130 / 4, false)[json['spriteIndex']]
    end

end