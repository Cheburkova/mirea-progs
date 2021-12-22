using HorizonSideRobots

function corner(r::Robot)
    n=0
    w=0
    while !isborder(r,Nord)
        move!(r,Nord)
        n+=1
    end
    while !isborder(r,West)
        move!(r,West)
        w+=1
    end
    all(r)
    while !isborder(r,Nord)
        move!(r,Nord)
    end
    while !isborder(r,West)
        move!(r,West)
    end
    for a in 1:w
        move!(r,Ost)
    end
    for a in 1:n
        move!(r,Sud)
    end
end

function all(r::Robot)
    while !isborder(r,Sud)
        for side in [Ost,West]
            while !isborder(r,side)
                putmarker!(r)
                move!(r,side)
            end
            putmarker!(r)
            move!(r,Sud)
        end
    end
    while !isborder(r,Ost)
        putmarker!(r)
        move!(r,Ost)
    end
    putmarker!(r)
end

corner(r)
