require './controller/view/home-controller'

class HomeView

    attr_reader :controller, :components

    def initialize (window)
        @components = []
        @controller = HomeController.new self, window
    end

    def draw
        @components.each do |component|
            component.draw
        end
    end

    def react_to_mouse
        @controller.react_to_mouse
    end

end