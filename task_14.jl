using HorizonSideRobots

function task14(r)
    for i = 0:3
        stripe(r,i)
    end
    putmarker!(r)
end

function stripe(r,side)
    y = 0
    sign = true
    while !isborder(r,HorizonSide(side % 4)) || sign
        if !isborder(r,HorizonSide(side % 4))
            move!(r,HorizonSide(side % 4))
            putmarker!(r)
            y += 1
        end
        if isborder(r,HorizonSide(side))
            sign, y = peregorodka(r,side,y)
            putmarker!(r)
        end
        if sign == false
            break
        end
    end
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

task14(r)