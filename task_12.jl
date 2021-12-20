using HorizonSideRobots

function revers(side::HorizonSide)
    side = HorizonSide((Int(side)+2)%4)
    return side
end

function c_move!(r, side::HorizonSide, c)
    for i = 1:c 
        move!(r,side)
    end 
end

function movements_to_side!(r, side::HorizonSide)
    c = 0
    while isborder(r,side) == 0
        move!(r,side)
        c += 1
    end 
    return c
end

function corner(r)
    x = 0
    y = 0
    while (isborder(r,Sud) == 0) || (isborder(r,West) == 0)
        y = y + movements_to_side!(r,Sud)
        x = x + movements_to_side!(r,West)
    end
    return x, y
end

function go_home!(r,x,y)
    corner(r)
    c_move!(r,Nord,y)
    c_move!(r,Ost,x)
end

function stripe(side,n,x,y,r)
    while isborder(r,side) == 0
        move!(r,side)
        if side == Ost
            x = x + 1;
        else
            x = x - 1;
        end
        draw(r,x,y,n)
    end
    return x,y
end

function draw(r,x,y,n)
    if ((x ÷ n) + (y ÷ n)) % 2 == 0
        putmarker!(r)
    end
end

function chess(r,n)
    z = 0
    m = 0
    z, m = corner(r)
    side = Ost;
    x = 0;
    y = 0;
    if ((x ÷ n) + (y ÷ n)) % 2 == 0
        putmarker!(r)
    end
    while isborder(r,Nord) == 0
        x, y = stripe(side,n,x,y,r)
        move!(r,Nord);
        y += 1;
        side = revers(side);
        draw(r,x,y,n)
    end
    x,y = stripe(side,n,x,y,r)
    go_home!(r,z,m)
end

n = 4

chess(r,n)