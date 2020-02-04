require './controller/view/home-controller'
require './ui/view/abstract-view'

class HomeView < AbstractView

    attr_reader :controller, :components

    def initialize (window)
        super()
        @controller = HomeController.new self, window
    end

    # @Override
    def react_to_mouse
        @controller.react_to_mouse
    end
end