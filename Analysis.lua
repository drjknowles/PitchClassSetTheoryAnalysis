function analyseSets() 
    
    setLabel = ""
    first = true
    for k,v in pairs(notes) do
        if v.selected and first then
            setLabel = v.number
            first = false
        elseif v.selected then
            setLabel = setLabel .. ", " .. v.number
        end
    end
    
end
