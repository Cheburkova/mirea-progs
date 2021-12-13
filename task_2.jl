using HorizonSideRobots

function corner(r::Robot)
    s=0::Int
    n=0::Int
    o=0::Int
    w=0::Int
    while !isborder(r,Sud)
        move!(r,Sud)
        s+=1
    end
    while !isborder(r,West)
        move!(r,West)
        w+=1
    end
    paintover(r)
    while !isborder(r,Sud)
        move!(r,Sud)
    end
    while !isborder(r,West)
        move!(r,West)
    end
    for o in 1:w
        move!(r,Ost)
    end
    for n in 1:s
        move!(r,Nord)
    end
end
    
function paintover(r)
    for side in [Nord,Ost,Sud,West]
        while (isborder(r,side)==0)
            move!(r,side)
            putmarker!(r)
        end
    putmarker!(r)
    end
end 

corner(r)
show(r)