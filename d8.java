import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

public class Main {
    public static int aoc_8_1() {
        int i = 0;
        String st = "";
        String prev = "AAA";
        Map<String, String[]> map = new HashMap<>();

        try {
            File file = new File("input.txt");
            Scanner myReader = new Scanner(file);
            while (myReader.hasNextLine()) {
                if (Objects.equals(st, "")) {
                    st = myReader.nextLine();
                }
                String data = myReader.nextLine();
                if (!Objects.equals(data, "")) {
                    map.put(data.substring(0, 3), new String[]{data.substring(7, 10), data.substring(12, 15)});
                }
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
        }

        while (true) {
            String next = map.get(prev)[st.charAt(i % st.length()) == 'R' ? 1 : 0];
            if (Objects.equals(next, "ZZZ")) {
                break;
            }
            prev = next;
            i += 1;

        }
        return i + 1;
    }

    public static long aoc_8_2() {
        String st = "";
        Map<String, String[]> map = new HashMap<>();
        List<String> visited = new ArrayList<>();
        List<Integer> when = new ArrayList<>();
        try {
            File file = new File("input.txt");
            Scanner myReader = new Scanner(file);
            while (myReader.hasNextLine()) {
                if (Objects.equals(st, "")) {
                    st = myReader.nextLine();
                }
                String data = myReader.nextLine();
                if (!Objects.equals(data, "")) {
                    map.put(data.substring(0, 3), new String[]{data.substring(7, 10), data.substring(12, 15)});
                    if (data.charAt(2) == 'A') {
                        visited.add(data.substring(0, 3));
                    }
                }
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
        }

        String finalSt = st;
        visited.forEach(v -> {
            int i = 0;
            String next = v;
            while (true) {
                next = map.get(next)[finalSt.charAt(i % finalSt.length()) == 'R' ? 1 : 0];
                if (next.charAt(2) == 'Z') {
                    when.add(i + 1);
                    break;
                }
                i += 1;
            }
        });

        long res = when.get(0);
        for (int i = 1; i < when.size(); i++) {
            res = lcm(res, when.get(i));
        }

        return res;
    }

    public static void main(String[] args) {
    }

    static long gcd(long a, long b) {
        if (b == 0)
            return a;
        return gcd(b, a % b);
    }

    static long lcm(long a, long b) {
        if (a > b)
            return (a / gcd(a, b)) * b;
        else
            return (b / gcd(a, b)) * a;
    }
}