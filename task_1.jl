using HorizonSideRobots

function krest(r::Robot)
    for side in [Nord,West,Sud,Ost]
        movekrest(r,side)
        reversekrest(r,side)
    end
    putmarker!(r)
end
    
function movekrest(r,side)
    while !isborder(r,side)
        move!(r,side)
        putmarker!(r)
    end
end
    
function reversekrest(r,side)
    while ismarker(r)==1
        move!(r,HorizonSide((Int(side)+2)%4))
    end
end

krest(r)