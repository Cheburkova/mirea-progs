using HorizonSideRobots

function obhod(r)
    c=0::Int
    count=0::Int
    while !isborder(r,Ost)
        move!(r,Ost)
        if ismarker(r)
            c += temperature(r)
            count += 1
        end
    end
    if !isborder(r,Nord)
        move!(r,Nord)
        if ismarker(r)
            c += temperature(r)
            count += 1
        end
    end
    while !isborder(r,West)
        move!(r,West)
        if ismarker(r)
            c += temperature(r)
            count += 1
        end
    end
    return c,count
end
    
function main(r)
    x=0
    y=0
    i=0
    j=0
    while !isborder(r,Nord)
        x, y = obhod(r)
        i += x
        j += y
    end
    return print(i / j)
end
    
main(r)
