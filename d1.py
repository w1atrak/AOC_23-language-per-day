def aoc_1_1():
    with open("input.txt", "r") as f:
        data = f.read()
    data = data.split("\n")

    result = 0
    for line in data:
        p = 0
        for c in line:
            if not c.isalpha():
                p = 10 * int(c)
                break
        for i in range(len(line) - 1, -1, -1):
            if not line[i].isalpha():
                p += int(line[i])
                break
        result += p

    return result


def aoc_1_2():
    result = 0
    with open("input.txt", "r") as f:
        data = f.read()
    data = data.split("\n")[:-1]

    digits = [str(i) for i in range(1, 10)]
    spelled = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    for line in data:
        indexes_start = [0 for _ in range(9)]
        indexes_end = [0 for _ in range(9)]
        for i in range(9):
            indexes_start[i] = line.find(spelled[i])
            indexes_start[i] = (
                float("inf") if indexes_start[i] == -1 else indexes_start[i]
            )
            if -1 < (v := line.find(digits[i])) < indexes_start[i]:
                indexes_start[i] = v

            indexes_end[i] = line.rfind(spelled[i])
            if (v := line.rfind(digits[i])) > indexes_end[i]:
                indexes_end[i] = v
        result += (
            10 * (1 + indexes_start.index(min(indexes_start)))
            + 1
            + indexes_end.index(max(indexes_end))
        )

    return result
