#include <stdio.h>

struct alumno {
    short comision; //->2 offset 0
    char * nombre; //->8 offset 8
    int edad; //->4 offset 16
}; //->24 se alinea al valor mas grande. o sea 8

// cc______nnnnnnnneeee____

struct alumno nuevo_alumno = {4, "Pepe", 21};

extern void mostrar_alumno(struct alumno * un_alumno);

int main(int argc, char * argv[]) {
    mostrarAlumno(&nuevo_alumno);
    return 0;
}
