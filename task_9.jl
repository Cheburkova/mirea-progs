using HorizonSideRobots

function poisk(r)
    j = 0
    i = 1
    while !ismarker(r)
        for n in 1:i
            move!(r,HorizonSide((j + 1) % 4))
            if ismarker(r)
                break
            end
        end
        if ismarker(r)
            break
        end
        for n in 1:i
            move!(r,HorizonSide((j + 2) % 4))
            if ismarker(r)
                break
            end
        end
        i += 1
        j += 2
    end
end
    
poisk(r)