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
    i=0

    while !isborder(r,Nord)
        if !isborder(r,Sud)
            move!(r,Nord)
        end
        if i == 1
            i = 0
        else
            i = 1
            putmarker!(r)
        end

        while !isborder(r,Ost)
            if i == 1
                move!(r,Ost)
                i = 0
            else
                move!(r,Ost)
                putmarker!(r)
                i = 1
            end
        end

        if !isborder(r,Nord)
            move!(r,Nord)
            if i == 1
                i = 0
            else
                i = 1
                putmarker!(r)
            end
            while !isborder(r,West)
                if i == 1
                    move!(r,West)
                    i = 0
                else
                    move!(r,West)
                    putmarker!(r)
                    i = 1
                end
            end
        end

    end
end

chessall(r)
