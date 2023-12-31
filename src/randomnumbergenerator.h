#ifndef RANDOMNUMBERGENERATOR_H
#define RANDOMNUMBERGENERATOR_H


class RandomNumberGenerator
{
public:
    RandomNumberGenerator();
    int pulse() const;
    int step() const;
    int sleep() const;
    int getRandomInteger(int minValue, int maxValue) const;
};

#endif // RANDOMNUMBERGENERATOR_H
