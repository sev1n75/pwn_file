/*
(写完程序)
“你自己运行了吗？😏”
“跑了一下🤥”
“感觉怎么样？🧐”
“我去除了大部分的安全问题，但是我保留了一部分” “我觉得保留了一部分漏洞，才知道你做的是CTF题🤓”
“你是有意把它保留的吗🤨”
“是编写过程中，我留下了一部分😌”
“是故意的还是不小心😨”
“是故意的😋”
（打开源码）
“🍴😵‍💫🥴😤😡🤬”
*/
#include <iostream>
#include <string>
#include <vector>
#include <exception>
#include <string_view>
#include <unordered_map>
#include <functional>
using namespace std;

string getInput()
{
    string res;
    getline(cin, res);
    if (res.size() > 64)
        throw std::runtime_error("Invalid input");
    while (!res.empty() && res.back() == '\n')
        res.pop_back();
    return res;
}
bool allow_admin = false;
auto splitToken(string_view str, string_view delim)
{
    if (!allow_admin && str.find("admin") != str.npos)
        throw std::invalid_argument("Access denied");
    vector<string_view> res;
    size_t prev = 0, pos = 0;
    do
    {
        pos = str.find(delim, prev);
        if (pos == std::string::npos)
        {
            pos = str.length();
        }
        res.push_back(str.substr(prev, pos - prev));
        prev = pos + delim.length();
    } while (pos < str.length() && prev < str.length());
    return res;
}
auto parseUser()
{
    auto tok_ring = splitToken(getInput(), ":");
    if (tok_ring.size() != 2)
        throw std::invalid_argument("Bad login token");
    if (tok_ring[0].size() < 4 || tok_ring[0].size() > 16)
        throw std::invalid_argument("Bad login name");
    if (tok_ring[1].size() > 32)
        throw std::invalid_argument("Bad login password");
    return make_pair(tok_ring[0], tok_ring[1]);
}
const unordered_map<string_view, function<void(string_view)>> handle_admin = {
    {"admin", [](auto)
     {
         system("/readflag");
     }},
    {"?", [](auto)
     {
         cout << "Enjoy :)" << endl;
         cout << "https://www.bilibili.com/video/BV1Nx411S7VG" << endl;
     }}};
constexpr auto handle_guest = [](auto)
{
    cout << "Hello guest!" << endl;
};
int main()
{
    auto [username, password] = parseUser();
    cout << "Enter 'login' to continue, or enter 'quit' to cancel." << endl;
    auto choice = getInput();
    if (choice == "quit")
    {
        cout << "bye" << endl;
        return 0;
    }
    if (auto it = handle_admin.find(username); it != handle_admin.end())
    {
        it->second(password);
    }
    else
    {
        handle_guest(password);
    }
}
