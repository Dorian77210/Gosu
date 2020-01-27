module Geometry

    def Rectangle

        attr_accessor :x, :y, :height, :width

        def initialize (x, y, width, height)
            @x = x
            @y = y
            @width = width
            @height = height
        end

        def collide? (rect)
            @x < rect.x + rect.width)
            && (@x + @width > rect.x)
            && (@y < rect.y + rect.height)
            && (@height + @y > rect.y)
        end

    end

end