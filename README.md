# Build Speed

This project aims to provide clarity into the Gradle build process in
Android Studio, and to serve as a reasonable place to experiement with
build settings to attempt to speed up Gradle builds.

In order to effectively test Gradle build speed, it is critical to have a
repeatable process that causes a real-world compilation scenario.  For example,
it's very common to make a change to a file, then want to check that change on
the device.  In order to accomplish that in an automated way, I've created two
scripts.  The first reaches into the project's source code and alters a string
inside a resource to give it the current stringified date.  The second attempts
to build and run the project in the same way as Android Studio's own build
process.

When put together, you get a command like this:

```
./cli/update_date_in_string; time ./cli/build_and_run
```

You can run the same result from within Android Studio by first running

```
./cli/update_date_in_string
```
then using Android Studio's run command.

Using those two approaches, I was able to determine that the build artifacts
created by both processes were the same by doing:

```
find . -mmin -1
```

within a minute of running the actual build.  Also, it *appears* that the build
processes take nearly the same amount of time.  Combined, these results lead me
to believe that the build process I've codified in the "build_and_run" script
is *very* similar to, if not the same as, the Android Studio build and run
process.
