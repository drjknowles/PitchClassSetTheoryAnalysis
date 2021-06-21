-- PCST Analysis

-- Use this function to perform your initial setup
function setup()
    
    -- Setup variables
    prevTouchState = ENDED
    handleTouch = false
    setChanged = false
    setLabel = "Pitch class set theory analysis"
    
    -- Setup drawing modes
    textMode(CENTER)
    ellipseMode(CENTER)
    viewer.mode = FULLSCREEN
    
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
    -- Mouse handling
    if (prevTouchState == BEGAN or prevTouchstate == CHANGED) and CurrentTouch.state == ENDED then
        handleTouch = true
    else
        handleTouch = false
    end
    
    prevTouchState = CurrentTouch.state
    
    -- This sets a dark background color 
    background(backgroundColour)
    
    -- This sets the line thickness
    strokeWidth(5)
    
    -- Draw the main circle
    fill(backgroundColour)
    stroke(circleColour)
    ellipse(circleCentreX, circleCentreY, circleSize, circleSize)
    
    
    -- Draw the lines
    lastSelectedNote = nil
    firstSelectedNote = nil
    for k,v in pairs(notes) do
        if v.selected then
            -- Check to see if this is the first note
            if firstSelectedNote == nil then
                firstSelectedNote = v
            end
            
            if lastSelectedNote ~= nil then
                line(lastSelectedNote.x, lastSelectedNote.y, v.x, v.y)
            end
            
            lastSelectedNote = v
        end      
    end
    
    -- Then do the final join
    if lastSelectedNote ~= nil and firstSelectedNote ~= nil then
        line(lastSelectedNote.x, lastSelectedNote.y, firstSelectedNote.x, firstSelectedNote.y) 
    end
    
    
    -- Draw the notes
    for k,v in pairs(notes) do
        v:draw()
    end
    
    -- Check if set has changed
    if setChanged then
        analyseSets()
        setChanged = false
    end
    
    textSize(50)
    fill(textColour)
    text(setLabel, WIDTH / 2, HEIGHT / 2)
    
end

