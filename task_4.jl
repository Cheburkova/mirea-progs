using HorizonSideRobots

function corner(r::Robot)
    s=0
    w=0
    while !isborder(r,Sud)
        move!(r,Sud)
        s+=1
    end
    while !isborder(r,West)
        move!(r,West)
        w+=1
    end
    diag(r)
    move!(r,West)
    putmarker!(r)
    paint(r)
    while !isborder(r,Sud)
        move!(r,Sud)
    end
    while !isborder(r,West)
        move!(r,West)
    end
    for a in 1:w
        move!(r,Ost)
    end
    for a in 1:s
        move!(r,Nord)
    end
end
    
function paint(r::Robot)
    while !isborder(r,Sud) || !isborder(r,West)
        while !ismarker(r)
            putmarker!(r)
            move!(r,Ost)
        end
        move!(r,Sud)
        while !isborder(r,West)
            move!(r,West)
        end
    end
    while !isborder(r,Ost)
        putmarker!(r)
        move!(r,Ost)
    end
end
    
function diag(r)
    while !isborder(r,Ost)
        move!(r,Ost)
    end
    putmarker!(r)
    while !isborder(r,Nord) && !isborder(r,West)
        move!(r,Nord)
        move!(r,West)
        putmarker!(r)
    end
end
    
corner(r)
