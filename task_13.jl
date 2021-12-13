using HorizonSideRobots

function line(r,i)
    while !isborder(r,HorizonSide(i % 4)) && !isborder(r,HorizonSide((i+1) % 4))
        move!(r,HorizonSide(i % 4))
        move!(r,HorizonSide((i+1) % 4))
        putmarker!(r)
    end
    while ismarker(r)
        move!(r,HorizonSide((i+2) % 4))
        move!(r,HorizonSide((i+3) % 4))
    end
end

function direction(r)
    for i in 0:3
        line(r,i)
    end
    putmarker!(r)
end

direction(r)