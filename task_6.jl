using HorizonSideRobots

function perimeter2(r)
    i, j = findcorner(r)
    a = findperegorodky(r)
    obvodka(r,a)
    findcorner2(r)
    home(r,i,j)
end

function findcorner(r)
    i=0::Int
    j=0::Int
    while !isborder(r,Sud)
        move!(r,Sud)
        j += 1
    end
    while !isborder(r,West)
        move!(r,West)
        i += 1
    end
    while !isborder(r,Sud)
        move!(r,Sud)
        j += 1
    end
    while !isborder(r,West)
        move!(r,West)
        i += 1
    end
    return i, j
end

function findperegorodky(r)
    schet1=1
    schet2=1
    while !isborder(r,Ost)
        move!(r,Ost)
        schet1 += 1
    end
    move!(r,Nord)
    a=0
    while true
        while !isborder(r,West)
            move!(r,West)
            schet2 += 1
        end
        if schet2 == schet1
            schet2 = 1
            move!(r,Nord)
        else
            a = 1
            break
        end
        while !isborder(r,Ost)
            move!(r,Ost)
            schet2 += 1
        end
        if schet2 == schet1
            schet2 = 1
            move!(r,Nord)
        else
            a = 3
            break
        end
    end
    return a
end

function obvodka(r,a)
    putmarker!(r)
    while isborder(r,HorizonSide(a))
        move!(r,Nord)
        putmarker!(r)
    end
    move!(r,HorizonSide(a))
    putmarker!(r)
    while isborder(r,Sud)
        move!(r,HorizonSide(a))
        putmarker!(r)
    end
    move!(r,Sud)
    putmarker!(r)
    a += 2
    while isborder(r,HorizonSide(a % 4))
        move!(r,Sud)
        putmarker!(r)
    end
    move!(r,HorizonSide(a % 4))
    putmarker!(r)
    while isborder(r,Nord)
        move!(r,HorizonSide(a % 4))
        putmarker!(r)
    end
end

function findcorner2(r)
    for side in [Sud,West]
        while !isborder(r,side)
            move!(r,side)
        end
    end
end

function home(r,i,j)
    for n in 1:i
        move!(r,Ost)
    end
    for n in 1:j
        move!(r,Nord)
    end
end

perimeter2(r)