using HorizonSideRobots

function s_peregorodki(r)
    sum = 0
    Z = 0
    goinSWcorner(r)
    while !isborder(r,Nord)
        Z = search(r)
        if sum < Z
            sum = Z
        end
    end
    return sum
end

function goinSWcorner(r)
    sign = true
    while !isborder(r,Sud) || sign
        if !isborder(r,Sud)
            move!(r,Sud)
        end
        if isborder(r,Sud)
            sign = obhod(r,2)
        end
    end
    while !isborder(r,West)
        move!(r,West)
    end
end

function obhod2(r,side)
    a = 0
    b = 0
    x = 0
    sign = true
    while isborder(r,HorizonSide(side)) && !isborder(r,HorizonSide((side + 1) % 4))
        move!(r,HorizonSide((side + 1) % 4))
        x += 1
        a += 1
    end
    if isborder(r,HorizonSide(side)) && isborder(r,HorizonSide((side + 1) % 4))
        sign = false
    end
    if  !isborder(r,HorizonSide(side))     
        move!(r,HorizonSide(side))
    end
    while !isborder(r,HorizonSide(side)) && isborder(r,HorizonSide((side + 3) % 4))
        move!(r,HorizonSide(side))
        b += 1
    end
    for i = 1:x
        move!(r,HorizonSide((side+3) % 4))
    end
    return sign, (a)*(b)
end

function obhod(r,side)
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

function search(r)
    sign = true
    sum = 0
    Z = 0
    if !isborder(r,Nord)
        sign = true
        move!(r,Nord)
        while !isborder(r,Ost) || sign
            if !isborder(r,Ost)
                move!(r,Ost)
            else
                sign, Z = obhod2(r,3)
                if sum < Z
                    sum = Z
                end
            end
        end
    end
    sign = true
    while !isborder(r, West) || sign
        if !isborder(r, West)
            move!(r, West)
        else
            sign = obhod(r,1)
        end
    end
    return sum
end

s_peregorodki(r)