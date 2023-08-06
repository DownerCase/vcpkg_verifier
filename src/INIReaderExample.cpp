// The "inih" library is distributed under the New BSD license:

// Copyright (c) 2009, Ben Hoyt
// All rights reserved.

// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Ben Hoyt nor the names of its contributors
//       may be used to endorse or promote products derived from this software
//       without specific prior written permission.

// THIS SOFTWARE IS PROVIDED BY BEN HOYT ''AS IS'' AND ANY
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL BEN HOYT BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// Example that shows simple usage of the INIReader class

#include <iostream>
#include <INIReader.h>

int main()
{
  INIReader reader("../examples/test.ini");

  if (reader.ParseError() < 0) {
    std::cout << "Can't load 'test.ini'\n";
    return 1;
  }
  std::cout << "Config loaded from 'test.ini': version="
    << reader.GetInteger("protocol", "version", -1) << ", unsigned version="
    << reader.GetUnsigned("protocol", "version", -1) << ", trillion="
    << reader.GetInteger64("user", "trillion", -1) << ", unsigned trillion="
    << reader.GetUnsigned64("user", "trillion", -1) << ", name="
    << reader.Get("user", "name", "UNKNOWN") << ", email="
    << reader.Get("user", "email", "UNKNOWN") << ", pi="
    << reader.GetReal("user", "pi", -1) << ", active="
    << reader.GetBoolean("user", "active", true) << "\n";
  std::cout << "Has values: user.name=" << reader.HasValue("user", "name")
    << ", user.nose=" << reader.HasValue("user", "nose") << "\n";
  std::cout << "Has sections: user=" << reader.HasSection("user")
    << ", fizz=" << reader.HasSection("fizz") << "\n";
  return 0;
}
