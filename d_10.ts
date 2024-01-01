import * as fs from "fs";

const UP = [-1, 0];
const LEFT = [0, -1];
const DOWN = [1, 0];
const RIGHT = [0, 1];

const directions = {
  "|": [UP, DOWN],
  "-": [LEFT, RIGHT],
  L: [UP, RIGHT],
  J: [UP, LEFT],
  "7": [DOWN, LEFT],
  F: [DOWN, RIGHT],
  S: [UP, DOWN, LEFT, RIGHT],
  ".": [],
};

function aoc_10_1(): number {
  const input: string[] = fs
    .readFileSync("./input.txt", "utf-8")
    .split("\n")
    .map(x => x.trim());

  let x: number = 0,
    y: number = 0,
    counter: number = 0;

  for (let i = 0; i < input.length; i++) {
    for (let j = 0; j < input[0].length; j++) {
      if (input[i][j] === "S") {
        x = i;
        y = j;
      }
    }
  }

  let prev = [0, 0];
  while (input[x][y] !== "S" || !counter) {
    for (let direction of directions[input[x][y]]) {
      if (direction[0] === -prev[0] && direction[1] === -prev[1]) continue;
      if (
        directions[input[x + direction[0]][y + direction[1]]].filter(
          d => d[0] === -direction[0] && d[1] === -direction[1]
        ).length
      ) {
        prev = [direction[0], direction[1]];
        x = x + direction[0];
        y = y + direction[1];
        counter++;
        break;
      }
    }
  }

  return counter / 2;
}
