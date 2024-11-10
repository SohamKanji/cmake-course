# CMake Course

## Building a project

1. Make a ‘build’ directory in your project.
2. Also make sure you have CMakeLists.txt in your project.
3. Now `cd build`
4. `cmake ..`  → generates the build files / configures the project
5. `cmake --build .` → generates executable

Instead of steps 3-5, we could also do:

1. `cmake -S <path to source> -B <path to build>`
2. `cmake —build <path to build>`

## Generators in CMake

A *CMake Generator* is responsible for writing the input files for a native build system. Exactly one of the [CMake Generators](https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html#cmake-generators) must be selected for a build tree to determine what native build system is to be used. 

Do `cmake --help` and scroll down to see all supported generators.

And if you want to configure a specific generator for your project,

`cmake -S <path to source> -B <path to build> -G "<generator name>"`

For example,

`cmake -S <path to source> -B <path to build> -G "Unix Makefiles"`

## Introduction to Libraries

Say we have a file `my_lib.h / my_lib.cc.`

In-order to compile it, we have to add it as a target in CMakeLists.txt.

`add_library(Library STATIC my_lib.cc)`

Here, we can have other options instead of `STATIC` , we will discuss that later.

Now, we also need to link the Executable to the library, incase we are using it in the `main` (which, let’s say, we are).

`target_link_libraries(Executable PUBLIC Library)`

This is called adding a dependency. Our `Executable` depends on library. We can have other options instead of `PUBLIC` , which we will discuss later.

In order to build a specific target, we can

`cmake --build <path to build> --target Library`

`cmake --build <path to build> --target Executable` 

Note that building `Executable` will build `Library` too since of the dependency added.

## Creating Subdirectories and organising project

Say we have the following project structure:

```python
cmake-course/
|--app/
|  |--main.cc
|--src/
|  |--my_lib/
|     |--my_lib.h
|     |--my_lib.cc
|--CMakeLists.txt
```

For each of subdirectories we would need to create a separate CMakeLists.txt file.

For my_lib directory, we will have

```cpp
add_library(Library STATIC my_lib.cc)
target_include_directories(Library PUBLIC "./")
```

Here, `target_include_directories` is used for adding the path to the includes.

For src directory, we will have:

```cpp
add_subdirectory(my_lib)
```

For app directory, we will have

```cpp
add_executable(Executable main.cc)
target_link_libraries(Executable PUBLIC Library)
```

For the root directory, we will have

```cpp
cmake_minimum_required(VERSION 3.31)

project(CMakeCourse VERSION 1.00 LANGUAGES C CXX)

add_subdirectory(src)
add_subdirectory(app)
```

So effective project structure:

```cpp
cmake-course/
|--app/
|  |--main.cc
|  |--CMakeLists.txt
|--src/
|  |--my_lib/
|  |  |--my_lib.h
|  |  |--my_lib.cc
|  |  |--CMakeLists.txt
|  |--CMakeLists.txt
|--CMakeLists.txt
```
