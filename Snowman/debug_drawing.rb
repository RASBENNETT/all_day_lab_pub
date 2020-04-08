
class DebugDrawing

    attr_accessor :state

    def initialize(state)
        @state = state
        @drawing = ""
    end

    def determine_drawing(state)

    @drawing = case state
        when 6
        return "
        __________ 
        |       
        |
        |       
        |       
        |       
        ___"
    
        when 5
        return "
        __________ 
        |       |
        |       O
        |  
        |     
        |       
        ___"
    
        when 4
        return "
        __________ 
        |       |
        |       O
        |       |
        |     
        |       
        ___"
    
        when 3
        return "
        __________ 
        |       |
        |       O
        |      /|
        |    
        |       
        ___"
    
        when 2
        return "
        __________ 
        |       |
        |       O
        |      /|/
        |    
        |       
        ___"

        when 1
        return "
        __________ 
        |       |
        |       O
        |      /|/
        |      /
        |       
        ___"

        when 0
        return "
        __________ 
        |       |
        |       O
        |      /|/
        |      //
        |       
        ___"
    

        end
    end


end