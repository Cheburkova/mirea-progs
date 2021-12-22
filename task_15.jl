using HorizonSideRobots

function putpointperimeter(r)
    start = []
    start = gocorner!(r)
    paintover(r)
    goback(r,start)
end

function counter(r,side)
    c=0
    while isborder(r,side) == 0
        move!(r,side)
        c += 1    
    end
    return c
end

function gocorner!(r)
start=[]
    while isborder(r,Nord)==0 || isborder(r,West)==0
        x=counter(r,Nord)
        y=counter(r,West)
        push!(start,x)
        push!(start,y)
    end
    return start
end

function paintover(r)
    for side in [Ost,Sud,West,Nord]
        while (isborder(r,side)==0)
            move!(r,side)
            putmarker!(r)
        end
    putmarker!(r)
    end
end 

function goback(r,start)
    reverse!(start)
    for i = 1:length(start)
        if i%2==0
            cmove!(r,Sud,start[i])
        else
            cmove!(r,Ost,start[i]) 
        end 
    end
end

function cmove!(r,side,c)
    for i in 1:c
        move!(r,side)
    end
end

putpointperimeter(r)