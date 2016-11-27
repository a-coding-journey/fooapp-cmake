#include "hello_app.h"
#include <iostream>

using namespace acj;

void HelloApp::greet()
{
  m_foo.greet();
}

int HelloApp::answer()
{
  return m_foo.answer();
}

int main(int argc, char **argv)
{
  HelloApp app{};

  app.greet();
  std::cout << "App answer: "  << app.answer()<< "\n";

  return 0;
}