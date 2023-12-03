#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

int size = 142;

bool checkNeighbors(char arr[size][size], int i, int start, int end)
{

    if (arr[i][start - 1] != '.' || arr[i][end + 1] != '.')
        return true;
    for (int j = start - 1; j <= end + 1; j++)
    {
        if (arr[i - 1][j] != '.' || arr[i + 1][j] != '.')
            return true;
    }

    return false;
}

int aoc_3_1()
{
    FILE *fp;
    fp = fopen("input.txt", "r");
    if (fp == NULL)
        exit(1);

    char arr[size][size];
    int i = 1, j = 1;
    char c;
    while ((c = fgetc(fp)) != EOF)
    {
        if (c == '\n')
        {
            i++;
            j = 1;
        }
        else
        {
            arr[i][j] = c;
            j++;
        }
    }
    fclose(fp);

    for (int i = 0; i < size; i++)
    {
        arr[i][0] = '.';
        arr[i][size - 1] = '.';
        arr[0][i] = '.';
        arr[size - 1][i] = '.';
    }

    int sum = 0;
    for (int i = 1; i < size; i++)
    {
        int part = 0, start = 0, end = 0;

        for (int j = 1; j < size; j++)
        {
            if (arr[i][j] - '0' >= 0 && arr[i][j] - '0' <= 9)
            {
                if (part == 0)
                    start = j;
                end = j;
                part = part * 10 + (arr[i][j] - '0');
            }
            else if (part != 0)
            {
                if (checkNeighbors(arr, i, start, end))
                    sum += part;
                part = 0;
            }
        }
    }

    return sum;
}

int gearsNo[140][140];
long gears[140][140];

void countGear(int i, int j, int part)
{
    gearsNo[i][j]++;
    gears[i][j] *= part;
}

void checkGears(char arr[size][size], int i, int start, int end, int part)
{
    if (arr[i][start - 1] == '*')
        countGear(i, start - 1, part);

    if (arr[i][end + 1] == '*')
        countGear(i, end + 1, part);

    for (int j = start - 1; j <= end + 1; j++)
    {
        if (arr[i - 1][j] == '*')
            countGear(i - 1, j, part);
        if (arr[i + 1][j] == '*')
            countGear(i + 1, j, part);
    }
}

long aoc_3_2()
{
    for (int i = 0; i < 140; i++)
    {
        for (int j = 0; j < 140; j++)
        {
            gears[i][j] = 1;
            gearsNo[i][j] = 0;
        }
    }

    FILE *fp;
    fp = fopen("input.txt", "r");
    if (fp == NULL)
        exit(1);

    char arr[size][size];
    int i = 1, j = 1;
    char c;
    while ((c = fgetc(fp)) != EOF)
    {
        if (c == '\n')
        {
            i++;
            j = 1;
        }
        else
        {
            arr[i][j] = c;
            j++;
        }
    }
    fclose(fp);

    for (int i = 0; i < size; i++)
    {
        arr[i][0] = '.';
        arr[i][size - 1] = '.';
        arr[0][i] = '.';
        arr[size - 1][i] = '.';
    }

    long sum = 0;
    for (int i = 1; i < size; i++)
    {
        int part = 0, start = 0, end = 0;

        for (int j = 1; j < size; j++)
        {
            if (arr[i][j] - '0' >= 0 && arr[i][j] - '0' <= 9)
            {
                if (part == 0)
                    start = j;
                end = j;
                part = part * 10 + (arr[i][j] - '0');
            }
            else if (part != 0)
            {
                checkGears(arr, i, start, end, part);
                part = 0;
            }
        }
    }

    for (int i = 0; i < 140; i++)
    {
        for (int j = 0; j < 140; j++)
        {
            if (gearsNo[i][j] == 2)
                sum += gears[i][j];
        }
    }

    return sum;
}
