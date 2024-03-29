using HorizonSideRobots

function al1(r)
    y = 0
    z = 0
    x = 0
    y, z = ugl(r)
    x = line(r)
    prohod(r,x)
    while !isborder(r,Sud)
        move!(r,Sud)
    end
    Vozvrat(r,y,z)
end

function line(r)
    putmarker!(r)
    y = 0    
    while !isborder(r,Ost)
       move!(r,Ost)
       putmarker!(r)
       y += 1
    end
    while !isborder(r,West)
        move!(r,West)
    end
    move!(r,Nord)
    return y-1
end

function line2(r,y)
    sign = true
    putmarker!(r)
    while y > 0
        if !isborder(r,Ost)
            move!(r,Ost)
            putmarker!(r)
            y -= 1
        else
            sign, y = obhod3(r,3,y)
            if y >= 0
                putmarker!(r)
            end
        end
    end
    while !isborder(r,West) || sign
        if !isborder(r,West)
            move!(r,West)
        else
            sign =obhod(r,1)
        end
    end
end

function prohod(r,y)
    while !isborder(r,Nord)
        line2(r,y)
        y -= 1
        move!(r,Nord)
    end
    line2(r,y)
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

function obhod2(r,side,y)
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
        y+=1
    end
    while !isborder(r,HorizonSide(side)) && isborder(r,HorizonSide((side + 1) % 4))
        move!(r,HorizonSide(side))
        y+= 1
    end
    for i = 1:x
        move!(r,HorizonSide((side+1) % 4))
    end
    return sign,y
end

function Vozvrat(r,y,z)
    sign = true
    for i = 1:z
        move!(r,Ost)
    end
    while y > 0
        if !isborder(r,Nord)
            move!(r,Nord)
            y -= 1
        else
            sign, y = obhod3(r,0,y)
        end
    end
end

function obhod3(r,side,y)
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
        y-=1
    end
    while !isborder(r,HorizonSide(side)) && isborder(r,HorizonSide((side + 1) % 4))
        move!(r,HorizonSide(side))
        y-= 1
    end
    for i = 1:x
        move!(r,HorizonSide((side+1) % 4))
    end
    return sign,y
end

function goinSWcorner(r)
    sign = true
    y = 0
    z = 0
    while !isborder(r,Sud) || sign 
        if !isborder(r,Sud)
            move!(r,Sud)
            y += 1
        end
        if isborder(r,Sud)
            sign,y =  obhod2(r,2,y)
        end
    end
    while !isborder(r,West)
        move!(r,West)
        z += 1
    end
    return y,z
end

al1(r)