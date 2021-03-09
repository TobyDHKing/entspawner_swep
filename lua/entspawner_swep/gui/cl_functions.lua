function ESS.CreateFont(name, size, weight, font)
    surface.CreateFont("ESS." .. name, {
        font = font or "Trebuchet18" ,
        size = size or 18,
        weight = weight or 400
    })
end

local scrH = ScrH
local max = math.max
function ESS.Scale(value)
    return max(value * (scrH() / 1080), 1)
end