using HorizonSideRobots

function task11(r)
    for side = 0:3
        onepoint(r,side)
    end  
end

function onepoint(r,side)
    y = 0
    sign = true
    while !isborder(r,HorizonSide(side)) || sign
        if !isborder(r,HorizonSide(side))
            move!(r,HorizonSide(side))
            y += 1
        end
        if isborder(r,HorizonSide(side))
            sign, y = peregorodka(r,side,y)
        end
        if sign == false
            break
        end
    end
    putmarker!(r)
    go_home(r,side,y)
end

function go_home(r,side,y)
    while y > 0
        if !isborder(r,HorizonSide((side + 2) % 4))
            move!(r,HorizonSide(((side + 2) % 4)))
        else
            x = 0
            while isborder(r,HorizonSide((side + 2) % 4)) && !isborder(r,HorizonSide((side + 1) % 4))
                move!(r,HorizonSide((side + 1) % 4))
                x += 1
            end    
            move!(r,HorizonSide((side + 2) % 4))
            while isborder(r,HorizonSide((side + 3) % 4))
                move!(r,HorizonSide((side + 2) % 4))
                y -= 1
            end
            for i = 1:x
                move!(r,HorizonSide((side + 3) % 4))
            end
        end
        y -= 1
    end
end

function peregorodka(r,side,y)
    x = 0
    sign = true
    while isborder(r,HorizonSide(side)) && !isborder(r,HorizonSide((side + 1) % 4))
        move!(r,HorizonSide((side + 1) % 4))
        x += 1
    end
    if isborder(r,HorizonSide(side)) && isborder(r,HorizonSide((side + 1) % 4))
        sign = false
    end
    if  !isborder(r,HorizonSide(side))     
        move!(r,HorizonSide(side))
        y += 1
    end
    while !isborder(r,HorizonSide(side)) && isborder(r,HorizonSide((side + 3) % 4))
        move!(r,HorizonSide(side))
        y += 1
    end
    for i = 1:x
        move!(r,HorizonSide((side+3) % 4))
    end
    return sign,y
end

task11(r)