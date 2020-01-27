class Component

    attr_reader :image, :x, :y, :id, :extra

    def initialize(image, x, y, id, extra = nil)
        @image = image
        @x = x
        @y = y
        @id = id
        @extra = extra
    end

    def draw
        @image.draw(@x, @y, 0)
    end

    def to_str
        "Component : x = #{@x}, y = #{@y}, image = #{@image}"
    end

    def collide?(x, y)
        (y >= @y) && (y <= @y + @image.height) && (x >= @x) && (x <= @x + @image.width)
    end
end