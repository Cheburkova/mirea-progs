using HorizonSideRobots

function chessall(r::Robot)
    s = 0
    w = 0

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

    for a in 1:w
        move!(r,Ost)
    end
    for a in 1:s
        move!(r,Nord)
    end
end

function shax(r::Robot)
    putmarker!(r)
    i = 0
    while !isborder(r,Nord)
        if !isborder(r,Sud)
            move!(r,Nord)
        end
        i = obr(r,i)
        i = stripe(r,Ost,i)
        if !isborder(r,Nord)
            move!(r,Nord)
            i = obr(r,i)
            i = stripe(r,West,i)
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
    return i
end

function stripe(r,side,i)
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
    return i
end

chessall(r)
