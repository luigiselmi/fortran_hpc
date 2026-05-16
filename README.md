Fortran HPC
===========
Fortran examples for numerical methods and computational physics. Examples are taken from the book [*Modern Fortran*](https://github.com/modern-fortran) by Milan Curcic and other books. 

## Compile and execute a Fortran program
We use the [GNU Fortran](https://gcc.gnu.org/fortran/) compiler to create an executable from a fortran file. The gfortran compiler can be installed on Linux and also on Windows with [Cygwin](https://www.cygwin.com/). In order to compile and link a fortran program use the command
```
$ gfortran hello.90 -o hello
```
The output will be an executable hello.exe that can be run using the command
```
$ ./hello.exe
```
