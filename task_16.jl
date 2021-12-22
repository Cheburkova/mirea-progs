using HorizonSideRobots

function alldraw(r)
    y = 0
    z = 0
    y, z = goinSWcorner(r)
    draw(r)
    vozvrat(r,y,z)
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

function draw(r)
    sign2 = true    
    while !isborder(r,Nord) || sign2
        sign1 = true
        while !isborder(r,Ost) || sign1
            putmarker!(r)
            if !isborder(r,Ost)
                move!(r,Ost)
            else
                sign1 = obhod(r,3)
            end
        end
        sign1 = true
        while !isborder(r,West) || sign1
            if !isborder(r,West)
                move!(r,West)
            else
                sign1 = obhod(r,1)
            end
        end
        if !isborder(r,Nord)
            move!(r,Nord)
        else
            sign2 = obhod(r,0)
        end
    end
end

function vozvrat(r,y,z)
    sign = true
    while !isborder(r,Sud)
        move!(r,Sud)
    end
    while !isborder(r,West)
        move!(r,West)
    end
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

alldraw(r)