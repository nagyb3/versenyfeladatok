#include <iostream>
#include <numeric>
#include <vector>
#include <algorithm>
#include <cmath>

using namespace std;

int main() {
    int n;
    vector<int> vec;

    cin >> n;
    int val;
    for (int i = 0; i < n; i++) {
        cin >> val;
        vec.push_back(val);
    }

    sort(vec.begin(), vec.end());
    int median = vec.at(n / 2);

    long long sumDiff = 0;
    for_each(vec.begin(), vec.end(), [&sumDiff, &median](int n) {
        sumDiff += abs(n - median);
    });
    cout << sumDiff << endl;

    return 0;
}
