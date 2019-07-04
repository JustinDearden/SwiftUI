g++ -std=c++2a -fconcepts c1.cxx

#include <algorithm>
#include <type_traits>
#include <iostream>


//restrictions
template <typename T>
concept bool SimpleArithmicType = 
requires(T a, T b) {

//Function declaration 
    { add(a,b) } -> T;
//Each check the compiler will return a bool
    { a + b } -> T;
    { a - b } -> T;
    { a * b } -> T;
    { a / b } -> T;
    { a % b } -> T;

    { a += b } -> T&;
    { a -= b } -> T&;
    { a *= b } -> T&;
    { a /= b } -> T&;

    { a == b } -> bool;
    { a != b } -> bool;
    { a < b } -> bool;
};

template <typename I>
concept bool SimpleUnsignedIntegralArithmeticType =
SimpleArithmicType<I> && std::is_integral<I>::value && std::is_unsigned<I>::value;



template <typename I>

requires SimpleArithmicType<I>
I middle(I const& a, I const& b) {
    #if 0
    return (a+b)/2;
    #endif

    using std::minmax;
    auto const [mi,ma] = minmax(a,b);
    return mi + (ma-mi)/2;
}

//add function
template (typenmae T>)
int add(int a, int b) { return a + b; }
T add(T a, T b) { return a + b; }

int main() {
    using namespace std;

    cout << middle(5,10) << '\n';
    cout << middle(55,10) << '\n';
    cout << middle(5,-10) << '\n';
    cout << middle(1.1,39.2) << '\n';
}






Define all the constructors and destructors L03 slide bank that covers it all
Moving constructs copy constructs - Jan 15 slides 

Jan 22 slides
virtual tables 
Know the pointers - virtual function 
virtual inheritence 
Slide 10
slide 58 = pure virtual with an equal 0

Assignments and project
Code from live demos in class 

Operator over loads - read in and write out streams for different containers slide 85 from early jan I/O for user defined types 
variable your not modifying make it a const reference 

L-value reference is a reference to an L-value
same for R

auto and decltype
values and references  slide 24
slide 29 read-write (T8, T* const, etc.)

lambda functions - 71

Jan 15 slides 138 total
STD library 
Unary and binary predicate 

lambda that returns a bool 

iterators 
range based for loops - 123
122 normal for loop 

copy and swap -dealocating (make a local variable and swap it with what you want to create)

template , (prob not)regex 

libraries in the project - overloads 
call an algorithm, header and you will get what it is, know the ones we have used 
beginning to end, find the first value that is 5 then go to the next value after 100 - live code examples it was there 
