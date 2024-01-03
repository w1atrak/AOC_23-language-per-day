#include <algorithm>
#include <iostream>
#include <cstdlib>
#include <fstream>
#include <vector>
#include <set>
using namespace std;

int aoc_11_1()
{
    string input = "";
    int rows = 0, cols = 0;
    vector<pair<int, int>> galaxies;
    set<int> not_empty_rows, not_empty_cols;

    ifstream file("input.txt");
    if (file.is_open())
    {
        string line;
        while (getline(file, line))
        {
            input += line;
            cols = line.length();
            for (int i = 0; i < cols; i++)
            {
                if (line[i] == '#')
                {
                    galaxies.push_back(make_pair(rows, i));
                    not_empty_rows.insert(rows);
                    not_empty_cols.insert(i);
                }
            }
            rows++;
        }
        file.close();
    }

    int distance_sum = 0;
    for (int i = 0; i < galaxies.size(); i++)
    {
        for (int j = i + 1; j < galaxies.size(); j++)
        {
            int distance = 0;
            pair<int, int> galaxy_a = galaxies.at(i);
            pair<int, int> galaxy_b = galaxies.at(j);

            distance += abs(galaxy_a.first - galaxy_b.first) + abs(galaxy_a.second - galaxy_b.second);

            for (int row = min(galaxy_a.first, galaxy_b.first); row < max(galaxy_a.first, galaxy_b.first); row++)
            {
                if (not_empty_rows.find(row) == not_empty_rows.end())
                {
                    distance++;
                }
            }
            for (int col = min(galaxy_a.second, galaxy_b.second); col < max(galaxy_a.second, galaxy_b.second); col++)
            {
                if (not_empty_cols.find(col) == not_empty_cols.end())
                {
                    distance++;
                }
            }

            distance_sum += distance;
        }
    }

    return distance_sum;
}
