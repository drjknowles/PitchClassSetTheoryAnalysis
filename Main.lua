-- PCST Analysis

-- Use this function to perform your initial setup
function setup()
    
    -- Setup drawing modes
    textMode(CENTER)
    ellipseMode(CENTER)
    
    -- Setup colours
    backgroundColour = color(45, 87, 141)
    circleColour = color(253)
    textColour = color(253)
    
    -- Setup notes
    notes = {}
    table.insert(notes, Note("C", 0))
    table.insert(notes, Note("C#", 1))
    table.insert(notes, Note("D", 2))
    table.insert(notes, Note("Eb", 3))
    table.insert(notes, Note("E", 4))
    table.insert(notes, Note("F", 5))
    table.insert(notes, Note("F#", 6))
    table.insert(notes, Note("G", 7))
    table.insert(notes, Note("Ab", 8))
    table.insert(notes, Note("A", 9))
    table.insert(notes, Note("Bb", 10))
    table.insert(notes, Note("B", 11))
    
    angleSize = (360 / #notes)
    print(angleSize)
    
    -- Call sizechanged to setup the screen variables
    sizeChanged(WIDTH, HEIGHT)
end

-- Called automatically when the screen size changes
function sizeChanged(w, h)
    -- In case this gets called first
    if notes == nil then return end
    
    circleCentreX = WIDTH / 2
    circleCentreY = HEIGHT / 2
    
    if WIDTH > HEIGHT then
        circleSize = HEIGHT - 200
    else
        circleSize = WIDTH - 200
    end
    
    for i,v in ipairs(notes) do
        v.x = circleCentreX + circleSize / 2 * math.cos(angleSize * i * math.pi / 180)
        v.y = circleCentreY + circleSize / 2 * math.sin(angleSize * i * math.pi / 180)
    end
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(backgroundColour)

    -- This sets the line thickness
    strokeWidth(5)

    -- Draw the main circle
    fill(backgroundColour)
    stroke(circleColour)
    ellipse(circleCentreX, circleCentreY, circleSize, circleSize)

    
    -- Draw the notes
    for k,v in pairs(notes) do
        v:draw()
    end
    
end

