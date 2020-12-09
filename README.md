# Análisis Matemático

## Repo para subir los avances en los apuntes de análisis 2

### Reglas IMPORTANTES:

1) NUNCA pushear a master
2) Siempre trabajar en la branch asignada
3) Al crear una nueva branch, hacerla desde master.
4) Antes de pushear un avance, hacer pull para que esté todo sincronizado y no hayan conflictos
5) Simpre hacer commit -m "mensaje aclarando qué se hizo"
6) Nunca mergear sin que otra persona haya revisado el PR

### Pipeline para trabajar con github

*Para bajarse el repo (clonarlo):*
1) Ir a la carpeta que queramos desde la terminal
2) Ir a github y, desde el boton verde que dice "code", copiar la url
3) desde la terminal poner "git clone [copiar la url]"
4) Una carpeta va a aparecer con el contenido del repo "master"


5) Para cambiar de branch poner "git checkout nombre-de-la-branch"
6) En el caso de querer crear una IR A LA BRANCH MASTER y poner "git checkout -b nombre-nueva-branch"
7) Al estar trabajando en una branch, en el caso de querer saber si hace falta pushear algo poner "git status" Eso nos va a decir los archivos que hace faltan que subamos.

**Al comezar el trabajo (y antes de pushear), siempre bajar posibles avances de compañerxs poniendo "git pull"**

Cuando terminamos de trabajar, siempre pushear el avance:
1) poner "git status" (va a aparecer en rojo los archivos que modificamos)
2) "git add nombre-del-archivo"
(si acá volvemos a poner git status vamos a ver esos archivos en verde)
3) git commit -m "explicación corta de qué es lo que se hizo"
4) git push

### Workflow de trabajo

#### Instalación de dependencias

Para instalar las dependencias (Julia, Pluto, PlutoUI) ejecutar:

```bash
make deps
```

Basta con ejecutar esto una vez la primera vez que se comienza a trabajar en
el proyecto con una computadora nueva. Si ya existe una instalación previa
de Julia, el script no instalará Julia de nuevo.

#### Ejecutar Pluto

Para levantar Pluto basta con ejectuar:

```bash
make run
```

Esto debe ejecutarse cada vez que se quiera comenzar a trabajar.
