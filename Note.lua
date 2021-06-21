Note = class()

function Note:init(name, number)
    -- Setup params with some default params
    self.x = 0
    self.y = 0
    self.size = 80
    self.fontSize = 40
    self.selected = false
    self.background = color(64, 158, 41)
    self.highlighted = color(236, 67, 182)
    self.fill = color(0, 8, 255)
    
    -- Setup params with values from constructor
    self.name = name
    self.number = number
end

function Note:draw()
    -- Codea does not automatically call this method
    -- Draws the note onto the screen
    if self.selected then
        fill(self.highlighted)
    else
        fill(self.background)
    end
    
    stroke(circleColour)
 
    ellipse(self.x, self.y, self.size, self.size)
    fill(self.fill)
    
    
    
    fontSize(self.fontSize)
    text(self.name, self.x, self.y)
    
    if handleTouch and self:checkTouch() then
        if self.selected then
            self.selected = false
        else
            self.selected = true
        end
        setChanged = true
    end
end

function Note:checkTouch()
    if CurrentTouch.x > self.x - self.size / 2 and
    CurrentTouch.x < self.x + self.size / 2 and
    CurrentTouch.y > self.y - self.size / 2 and
    CurrentTouch.y < self.y + self.size / 2 then
        return true
    end
    
    return false
end

function Note:touched(touch)
    -- Codea does not automatically call this method
end
