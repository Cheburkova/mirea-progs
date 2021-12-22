using HorizonSideRobots

function counter_peregorodok(r)
    goinNWcorner(r)
    signsign = true
    sum = 0
    while !isborder(r,Nord) || signsign
        sum += count(r)
        if !isborder(r,Nord)
            move!(r,Nord)
        else
            signsign = peregorodka(r,0)
        end
    end
    return sum
end

function goinNWcorner(r)
    ssign = true
    while !isborder(r,Sud) || ssign
        if !isborder(r,Sud)
            move!(r,Sud)
        end
        if isborder(r,Sud)
            ssign = peregorodka(r,2)
        end
    end
    while !isborder(r,West)
        move!(r,West)
    end
    if !isborder(r,Nord)
        move!(r,Nord)
    else
        peregorodka(r,0)
    end
end

function peregorodka(r,side)
    x = 0
    sign = true
    while isborder(r,HorizonSide(side)) && !isborder(r,HorizonSide((side + 3) % 4))
        move!(r,HorizonSide((side + 3) % 4))
        x += 1
    end
    if isborder(r,HorizonSide(side)) && isborder(r,HorizonSide((side + 3) % 4))
        sign = false
    end
    if  !isborder(r,HorizonSide(side))     
        move!(r,HorizonSide(side))
    end
    while !isborder(r,HorizonSide(side)) && isborder(r,HorizonSide((side + 1) % 4))
        move!(r,HorizonSide(side))
    end
    for i = 1:x
        move!(r,HorizonSide((side+1) % 4))
    end
    return sign
end

function count(r)
    c1 = 0
    c2 = 0
    StopCount = true
    while  !isborder(r,Ost) || StopCount
        if isborder(r,Sud)
            c1 += 1
        else
            if c1 != 0
                c2 += 1
            end
            c1 = 0
        end
        if !isborder(r,Ost)
            move!(r,Ost)
        else
            StopCount = false
            if c1 != 0
                c2 += 1
            end
        end
    end
    while !isborder(r,West)
        move!(r,West)
    end
    return(c2)
end

counter_peregorodok(r)