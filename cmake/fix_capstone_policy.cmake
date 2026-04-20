# Patches capstone's CMakeLists.txt for compatibility with CMake >= 4.0:
#   - Removes cmake_policy(SET CMP0048 OLD) (rejected by CMake >= 3.27)
#   - Bumps cmake_minimum_required to 3.5 (CMake >= 4.0 dropped < 3.5 support)
file(READ "${DIR}/CMakeLists.txt" _content)
string(REPLACE
    "cmake_policy(SET CMP0048 OLD)"
    "# cmake_policy(SET CMP0048 OLD)"
    _content "${_content}")
string(REGEX REPLACE
    "cmake_minimum_required\\(VERSION [0-9]+\\.[0-9]+(\\.[0-9]+)?\\)"
    "cmake_minimum_required(VERSION 3.5)"
    _content "${_content}")
file(WRITE "${DIR}/CMakeLists.txt" "${_content}")
