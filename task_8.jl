using HorizonSideRobots

function sherlock(r)
    kek=3::Int
    lol=1::Int
    while isborder(r,HorizonSide(0))
        for a in 1:lol
            move!(r,HorizonSide(kek % 4))
            if !isborder(r, HorizonSide(0))
            break
            end
        end
    lol += 2
    kek += 2
    end
end

sherlock(r)