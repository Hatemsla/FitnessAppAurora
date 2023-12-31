#include <iostream>
#include <vector>
#include <cstdlib>
#include <ctime>

class RandomNumberGenerator {
public:
    // Метод для получения случайного числа в диапазоне от 60 до 100
    int pulse() const {
        return getRandomInteger(60, 100);
    }

    // Метод для получения случайного числа в диапазоне от 5000 до 25000
    int step() const {
        return getRandomInteger(5000, 25000);
    }

    // Метод для получения случайного числа в диапазоне от 3 до 14
    int sleep() const {
        return getRandomInteger(3, 14);
    }

private:
    // Метод для генерации случайного целого числа в заданном диапазоне
    int getRandomInteger(int minValue, int maxValue) const {
        return minValue + std::rand() % (maxValue - minValue + 1);
    }
};

struct DayData {
    std::string dayName;
    int sleepHours;
    int stepCount;
    int hardPoint;

    DayData(const std::string& name, int sleep, int step, int hard)
        : dayName(name), sleepHours(sleep), stepCount(step), hardPoint(hard) {}
};
