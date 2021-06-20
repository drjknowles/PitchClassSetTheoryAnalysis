Note = class()

function Note:init(name, number)
    -- Setup params with some default params
    self.x = 0
    self.y = 0
    self.size = 80
    self.fontSize = 40
    self.selected = false
    self.background = color(64, 158, 41)
    self.fill = color(0, 8, 255)
    
    -- Setup params with values from constructor
    self.name = name
    self.number = number
end

function Note:draw()
    -- Codea does not automatically call this method
    -- Draws the note onto the screen
    fill(self.background)
    stroke(circleColour)
 
    ellipse(self.x, self.y, self.size, self.size)
    fill(self.fill)
    fontSize(self.fontSize)
    text(self.name, self.x, self.y)
end

function Note:touched(touch)
    -- Codea does not automatically call this method
end
