function get_power(a)
    if 5 in a return 7 end
    if 4 in a return 6 end
    if 3 in a && 2 in a return 5 end
    if 3 in a return 4 end
    if 2 in a && count(x->x==1, a) == 1 return 3 end
    if 2 in a return 2 end

    return 1
end

    
function sort_hands(x,y)
    map = Dict('A'=>1, 'K'=>2, 'Q'=>3, 'J'=>4, 'T'=>5, '9' =>6, '8'=>7, '7'=>8, '6'=>9, '5'=>10,  '4'=>11, '3'=>12, '2'=>13)
    cardsX = [0,0,0,0,0,0,0,0,0,0,0,0,0]
    cardsY = [0,0,0,0,0,0,0,0,0,0,0,0,0]

    for i in 1:5
        cardsX[map[split(x, " ")[1][i]]] +=1
        cardsY[map[split(y, " ")[1][i]]] +=1
    end
    
    xPower = get_power(cardsX)
    yPower = get_power(cardsY)

    if xPower != yPower
        return xPower > yPower
    end

    for i in 1:5
        if map[split(x, " ")[1][i]] > map[split(y, " ")[1][i]]
            return false
        end
        if map[split(x, " ")[1][i]] < map[split(y, " ")[1][i]]
            return true
        end
    end
    
    return true
end


function aoc_7_1()
    lines = readlines("input.txt")
    sort!(lines, lt=sort_hands)

    result = 0
    for i in length(lines):-1:1
        result += i * parse(Int,split(lines[length(lines)-i+1]," ")[2])
    end

    return result
end


function get_power_joker(a, hand)
    Js = count(c->c=='J', hand)
    if 5 in a return 7 end

    if 4 in a 
        if Js == 1
            return 7
        end
        return 6 
    end
    if 3 in a && 2 in a 
        if Js < 3
            return 5 + Js
        end
        return 5 
    end
    if 3 in a 
        if Js == 1
            return 5
        end
        return 4 
    end
    if 2 in a && count(x->x==1, a) == 1
        if Js > 0
            return 3 + Js
        end
        return 3
    end
    if 2 in a
        if Js == 1
            return 3
        end
    return 2 
    end

    return 1
end


function sort_hands_joker(x,y)
    map = Dict('A'=>1, 'K'=>2, 'Q'=>3, 'T'=>4, '9' =>5, '8'=>6, '7'=>7, '6'=>8, '5'=>9, '4'=>10, '3'=>11, '2'=>12, 'J'=>13)
    cardsX = [0,0,0,0,0,0,0,0,0,0,0,0,0]
    cardsY = [0,0,0,0,0,0,0,0,0,0,0,0,0]

    for i in 1:5
        cardsX[map[split(x, " ")[1][i]]] +=1
        cardsY[map[split(y, " ")[1][i]]] +=1
    end
    
    xPower = get_power_joker(cardsX, split(x, " ")[1])
    yPower = get_power_joker(cardsY, split(y, " ")[1])

    if xPower != yPower
        return xPower > yPower
    end

    for i in 1:5
        if map[split(x, " ")[1][i]] > map[split(y, " ")[1][i]]
            return false
        end
        if map[split(x, " ")[1][i]] < map[split(y, " ")[1][i]]
            return true
        end
    end
    
    return true
end


function aoc_7_2()
    lines = readlines("input.txt")
    sort!(lines, lt=sort_hands_joker)

    result = 0
    for i in length(lines):-1:1
        result += i * parse(Int,split(lines[length(lines)-i+1]," ")[2])
    end

    return result
end
