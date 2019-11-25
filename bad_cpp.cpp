#include <stdio.h>
#include <stdlib.h>
#include <string.h>

constexpr size_t sz = 2048;
struct Big
{
    static constexpr size_t storage_size = sz / sizeof(int);
    int storage[storage_size];

    Big& operator=(const Big& rhs)
    {
        memcpy(&storage[0], &rhs.storage[0], sz);
        return *this;
    }
};
/*
void both_ok(Big * heap)
{
    Big stack;
    memset(stack.storage, 255, sz);
    //for(int i = 0; i < Big::storage_size; ++i)
        //stack.storage[i] = i & 1? 2 : 20;
      //  stack.storage[i] = 2;
    *heap = stack;
}
*/

void both_ok(Big * heap)
{
    Big stack;
    for(int i = 0; i < Big::storage_size; ++i)
        stack.storage[i] = i & 1? 2 : 20;
        //stack.storage[i] = 2;
    *heap = stack;
}