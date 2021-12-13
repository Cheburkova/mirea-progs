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
    if w%2==0
        shax(r)
    else
        move!(r,Ost)
        shax(r)
    end
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

function shax(r)
    putmarker!(r)
    i=0
    while !isborder(r,Nord)
        stripe(r,Ost)
        obr(r,i)
        if !isborder(r,Nord)
            move!(r,Nord)
            obr(r,i)
            stripe(r,West)
        end
    end
end

function obr(r,i)
    if i == 1
        i = 0
    else
        i = 1
        putmarker!(r)
    end
end

function stripe(r,side)
    while !isborder(r,side)
        if i == 1
            move!(r,side)
            i = 0
        else
            move!(r,side)
            putmarker!(r)
            i = 1
        end
    end
    move!(r,Nord)
end

corner(r)