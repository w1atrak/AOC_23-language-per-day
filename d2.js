const fs = require('fs');

function aoc_2_1() {
    let data = fs.readFileSync('input.txt', 'utf8').split('\n');
    let counter = 0;

    data.forEach(line => {
        let i = parseInt(line.match(/Game (\d+)/)[1]);
        const rgreen = /(\d+) green/g, rred = /(\d+) red/g, rblue = /(\d+) blue/g;
        let max_green = 0, max_red = 0, max_blue = 0;

        while (match = rgreen.exec(line)) {
            if (parseInt(match[1]) > max_green) {
                max_green = parseInt(match[1]);
            }
        }
        while (match = rred.exec(line)) {
            if (parseInt(match[1]) > max_red) {
                max_red = parseInt(match[1]);
            }
        }
        while (match = rblue.exec(line)) {
            if (parseInt(match[1]) > max_blue) {
                max_blue = parseInt(match[1]);
            }
        }

        if (max_red <= 12 && max_green <= 13 && max_blue <= 14) {
            counter += i;
        }
    });

    return counter;
}

function aoc_2_2() {
    let data = fs.readFileSync('input.txt', 'utf8').split('\n');
    let counter = 0;
    data.forEach(line => {
        const rgreen = /(\d+) green/g, rred = /(\d+) red/g, rblue = /(\d+) blue/g;
        let max_green = 0, max_red = 0, max_blue = 0;
        
        while (match = rgreen.exec(line)) {
            if (parseInt(match[1]) > max_green) {
                max_green = parseInt(match[1]);
            }
        }
        while (match = rred.exec(line)) {
            if (parseInt(match[1]) > max_red) {
                max_red = parseInt(match[1]);
            }
        }
        while (match = rblue.exec(line)) {
            if (parseInt(match[1]) > max_blue) {
                max_blue = parseInt(match[1]);
            }
        }

        counter += max_blue * max_green * max_red;
    });
    
    return counter;
}
