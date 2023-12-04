import java.io.File

fun aoc_4_1(): Double {
    var sum = 0.0
    val content = File("input.txt").readText().split("\n")

    for (line in content){
        val nums = line.split(":")[1].split("|")
        var matches = 0
        for (guess in nums[1].split(" ")){
            var g = guess.trim()
            if (g.toDoubleOrNull() != null && ("${nums[0]} ").contains(" ${g} ")) 
                matches++
        }
        if (matches > 0)
            sum = sum + Math.pow(2.toDouble(), (matches-1).toDouble())
    }
    return sum
}

fun aoc_4_2(): Int {
    val content = File("input.txt").readText().split("\n")
    var counts = IntArray(content.size)

    var index = 0
    for (line in content){
        counts[index]++;

        val nums = line.split(":")[1].split("|")
        var matches = 0
        for (guess in nums[1].split(" ")){
            var g = guess.trim()
            if (g.toDoubleOrNull() != null && ("${nums[0]} ").contains(" ${g} "))
                matches++
        }

        if (matches>0){
            for (ii in 0 until counts[index]){
                for (i in index+1 until index+matches+1){
                    counts[i] += 1
                }
            }
        }

        index++;
    }

    return counts.sum()
}
