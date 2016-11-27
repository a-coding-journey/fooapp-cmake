/**
 * Author: Michele Adduci
 * A Coding Journey
 * Example Hello Application class
 */
#ifndef _HELLO_APP_H_
#define _HELLO_APP_H_

#include "fooproject/my_class.h"

namespace acj
{
  class HelloApp
  {
    public:
      HelloApp() = default;

      void greet();

      int answer();

    private:
      MyClass m_foo{};
  };
}

#endif
