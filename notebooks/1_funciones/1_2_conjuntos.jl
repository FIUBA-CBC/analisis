### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 3b692fd0-85b1-11eb-1739-6d11326f0586
begin
	using Plots
	using PlutoUI
	plotly()
end

# ╔═╡ 9273a9e4-70b3-11eb-177b-a5e7c3e025ad
begin	
	x_est = collect(0:0.01:5)
	y_estimado_1(x) = 5x
	y_estimado_2(x) = 2x
	x_est_lf = collect(0:0.2:5)

	using Random
	Random.seed!(1)
	mediciones = 3*(x_est_lf) + Random.randn(length(x_est_lf))*2
	
    plot(x_est, y_estimado_1.(x_est), lab="f1(x) = 5x", color=:red)
	plot!(x_est, y_estimado_2.(x_est), lab="f2(x) = 2x", color=:blue)
	scatter!(x_est_lf, mediciones, lab="mediciones", color=:green)
	xlabel!("x")
	ylabel!("y")
end

# ╔═╡ 34c94b8e-70b1-11eb-1775-4392b3a4032a
md"# Conjuntos"

# ╔═╡ 5fedab20-70b1-11eb-2ab7-fd9463ced740
md"En apuntes pasados ya estuvimos viendo algunos ejemplos de conjuntos. En el de introducción a funciones, las analizamos como máquinas que toman elementos de un conjunto, al cual llamamos _dominio_, y los transforman en elementos de otro, al cual llamamos _codominio_. Por ejemplo, recordemos la función contadora de letras, que recibía una palabra del idioma español y devolvía la cantidad de letras que tenía. En aquel ejemplo, el dominio son las palabras, y el codominio los números naturales. Como observamos en aquella ocasión, no todos los números naturales podían ser generados por esta máquina, ya que no hay palabras en el lenguaje español tan grandes como querramos. La palabra más larga del idioma es \"electroencefalografista\", con lo cual no habrá palabras de más de 23 letras, las posibles salidas de la máquina son números entre 1 y 23. Ese conjunto de resultados posibles (la _imagen_) es entonces un _subconjunto_ del codominio."

# ╔═╡ a74b1bce-70b1-11eb-0b22-ef4dfbbebd07
# diagrama de palabras a números

# ╔═╡ ab15a4a4-70b1-11eb-38a6-5776a5796ff9
md"Un ejemplo típico es el de las cuadráticas, donde la imagen solo cumple una parte del dominio."

# ╔═╡ b1e86bf4-70b1-11eb-0fed-3322d236a1ff
begin
	x_cuad = collect(-5:0.01:5)
	y_cuad(x) = x.^2
	
    p_cuad = plot(x_cuad, y_cuad(x_cuad), lab="y(x) = x²", color=:red)
	xlabel!("x")
	ylabel!("x²")
    xlims!(-5,5)
    ylims!(0,10)
end

# ╔═╡ bb4bfd5a-70b1-11eb-38c4-e36b2f2fc66f
md"Para $f: \mathbb{R} \rightarrow \mathbb{R} / f(x) = x^2$ el dominio y el codominio son los números reales, pero la imagen son solo los reales positivos y el cero. Este conjunto, $\mathbb{R}^+_0$ es, como se intuye, un _subconjunto_ de los reales, y aprenderemos a notarlo más adelante en esta sección.

Otra idea que se desprende de aquí es que las funciones de alguna forma son un \"mapeo\" o un \"unir con flechas\" entre elementos del dominio y la imagen. Los ejemplos más obvios son los menúes de los restaurantes donde por cada producto se asigna un precio."

# ╔═╡ ce00ce08-70b1-11eb-2244-8ff341cfd2da
# gráfico con flechas que une productos y precios

# ╔═╡ d517e528-70b1-11eb-1c5c-bf7e4d27fd17
md"Si bien podemos hacer la misma analogía con $x^2$ o cualquier otra función de reales en reales, el \"problema\" es que tendríamos que usar una cantidad infinita de flechas para unir todos.

Esto ya nos va dando un par de intuiciones:

- Hay conjuntos que están \"contenidos\" en otros más grandes, como $\mathbb{R}^+_0$ en $\mathbb{R}$.
- Tanto las funciones como los conjuntos se pueden definir nombrando cada elemento o con una descripción que nos permita deducir los elementos."

# ╔═╡ e01e3a30-70b1-11eb-2aaa-d101b975658b
md"## ¿Cómo describimos un conjunto?

### Extensión"

# ╔═╡ df615b04-70b1-11eb-00f4-87872e446742
md"
Un conjunto se define por los miembros que \"pertenecen\" a él. Por ejemplo, en la enunciación 

> \"los colores cálidos son el rojo, el amarillo y el naranja\". 
 
Estamos definiendo al conjunto \"colores cálidos\" enumerando uno por uno los colores que pertenecen a él. Esto se llama \"definir un conjunto por _extensión_\". Notado de forma matemática, esto se ve así:

$$\text{Cálidos} = \{\text{rojo}, \text{amarillo}, \text{naranja}\}$$

Usamos las llaves $\{\}$ para explicar que lo que está adentro separado por comas es un conjunto. Cualquiera de los elementos que nombramos _pertenecen_ al conjunto. Esto se nota así:

$$\text{rojo} \in \text{Cálidos}$$

$$\text{amarillo} \in \text{Cálidos}$$

$$\text{naranja} \in \text{Cálidos}$$

Cualquier elemento que no esté allí _no pertenece_ al conjunto. Por ejemplo:

$$\text{azul} \notin \text{Cálidos}$$

### Tamaño o cardinalidad de un conjunto finito

Dado un conjunto $A$, definimos a su \"cardinalidad\" $|A|$ como la cantidad de elementos que tiene. Por ejemplo, para el caso de colores cálidos, donde sus elmeentso eran \"rojo\", \"amarillo\" y \"naranja\", $|A| = 3$.

### Intensión

Por otro lado, muchas veces es más fácil definir un conjunto explicando un criterio para decidir si algo pertenece a él o no. Esto es especialmente para los conjuntos de tamaño infinito como los reales y sus subconjuntos o para conjuntos ordenados como los naturales. Por ejemplo, ¿cómo notamos la imagen de la función contadora de letras? Podemos partir de un conjunto previamente conocido, como los naturales, y luego imponerle una restricción (entre 1 y 23) para quedarse con una parte (acotarlo). Esto se nota del siguiente modo:

$$\text{Im} (f) = \{n \in \mathbb{N} / 1 \le n \le 23 \}$$

Esto se lee \"la imagen de $f$ es el conjunto de los números $n$ pertenecientes a $N$ siempre y cuando sean mayores o iguales a $1$ y es menores o iguales a $23$\". Esta forma de definir un conjunto a través de su criterio es muy útil, ya que de lo contrario tendría que haber escrito 

$$\text{Im} (f) = \{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23\}$$

lo cual es muy largo y es impracticable para conjuntos más grandes o infinitos. Además, al definir un \"criterio\", podríamos hacer un programa para que la computadora me diga si un elemento pertenece o no a un conjunto por más que sea infinito. Por ejemplo, si definimos el conjunto. 

$$C = \{n \in \mathbb{N} :  10 \le n\}$$

podemos crear la función `pertenece_al_conjunto_c(n)` que toma un `n` entero y devuelve true (verdadero) cuando pertenece y false (falso) si no pertenece, sin necesidad de enumerar todos los elementos, lo cual sería imposible.
"

# ╔═╡ 2f51d17c-70b2-11eb-0c06-6dcf65cd5580
pertenece_al_conjunto_c(x) = 10 <= x

# ╔═╡ 1797499c-85b2-11eb-074c-07e0ce4dc06c
pertenece_al_conjunto_c(-5)

# ╔═╡ 35dc7b8e-85b2-11eb-279a-653cd745be7f
pertenece_al_conjunto_c(9)

# ╔═╡ 3f3375b6-85b2-11eb-1ebc-990600298754
pertenece_al_conjunto_c(10)

# ╔═╡ 40c57c26-85b2-11eb-1d3c-a5cde1dfec02
pertenece_al_conjunto_c(1337)

# ╔═╡ 43e0b51a-85b2-11eb-2b29-a93ab9292f97
pertenece_al_conjunto_c(100000000)

# ╔═╡ 34525a0a-70b2-11eb-0028-2d8d25e79a58
md"En el ejemplo anterior veíamos que la imagen de $f$ es un subconjunto de los naturales. Esto se nota del siguiente modo:

$$\text{Im}(f) \subset \mathbb{N}$$

Este símbolo es similar al de pertenencia $\in$, pero son sutilmente distintos. $x \in C$ signficia que $x$ es un elemento del conjunto $C$. $A \subset C$ signfica que _todos los elementos de $A$ están también en $B$_. De forma mátemática:

$$A \subset B \leftrightarrow (x \in A \rightarrow x \in B)$$

Es decir, si un elemento pertenece al subconjunto, ese elemento tiene que pertenecer al conjunto grande. Podemos decir que \"$A$ está incluido en $B$\", que \"$A$ está contenido en $B$\" o que \"$A$ es un subconjunto de $B$\"."

# ╔═╡ 5220da64-70b2-11eb-3aa6-a99d50dd3cb5
md"
## Intervalos

Especialmente para los conjuntos numéricos, muchas veces nos interesa definir conjuntos de números que están todos juntos. La temperatura del agua siempre estará, a presión ambiente, entre 0 y 100 grados centígrados. Estos son números reales contiguos, y llo llamamos intervalo.

Los intervalos siempre se definen por intensión: se los describe por sus extremos (un poco más de esto en la sección siguiente).

El más intuitivo es el que incluye a sus extremos, que es el cerrado. Se nota $[minimo, maximo]$. Esto significa que $x \in C \leftrightarrow minimo \le x \le maximo$. En otras palabras, $minimo \in C$ y $maximo \in C$. Hace un rato, cuando hablábamos de la imagen del contador de letras lo describimos como los números entre el 1 y el N. Esto justamente queda como $[1, N]$ porque hay palabras con 1 letra (\"a\") y palabras con N (\"electroencefalografista\" o lo que sea).

Por otro lado tenemos los intervalos abiertos, que no incluyen a sus extremos. Por ejemplo, el conjunto de temperaturas a las que el agua está garantizada que es totalmente líquida no incluye al 0 ni al 100, ya que en esas temperaturas coexisten o bien el estado sólido y el líquido, o bien el líquido y el gaseoso. Entonces el conjunto lo notamos como $C = (0, 100)$ y eso significa $x \in C \leftrightarrow 0 \lt x \lt 100$, lo cual significa que $0 \notin C$ y que $100 \notin C$.

Un intervalo puede ser abierto en un extremo y cerrado en el otro, es decir, incluir solo a uno de ellos. Para los números solemos llamar abierto a \"izquierda\" si el mínimo no está contenido y a \"derecha\" si eso es verdadero para el máximo. Idem para el cerrado."

# ╔═╡ 72d450da-70b2-11eb-0354-61dd5772357f
md"
> ### Breves pensamientos sobre el infinito
> El conjunto de los números mayores a N... Es un intervalo? Sí! Son todos números contiguos. Cómo lo notamos? $[N, \infty]$? Tenemos un problema. El infinito no es un número real! Para ser un número real debería tener, por ejemplo, un número que venga después, y esto no existe. El infinito más que un número es una idea. Es la idea de que no importa cuánto siga creciendo, no voy a llegar a un tope. Para salvaguardar este vacío legal, siempre que tenemos al infinito como el extremo de un intervalo dejamos ese extremo abierto: $[N, \infty)$. Como recordatorio, esto significa que si alguna vez escuchamos $\frac{1}{0} = \infty$, esto no es matemática seria. Simplemente es una forma intuitiva de decir que si yo hago $y = \frac{1}{x}$ el $y$ será tan grande como pequeño sea $x$. De nuevo, el infinito corresponde a la idea de \"potencial ilimitado para crecer\", no a un número en especial. Retomaremos esta idea de \"acercarse tanto como quiero\" o \"alejarse tanto como quiera\" cuando veamos límites, algunas unidades más adelante.

"

# ╔═╡ 85e6e57a-70b2-11eb-2485-91b7963071a0
md"
### Cardinalidad de un conjunto infinito

La intensión nos da el poder ahora de definir conjuntos con infinitos elementos. ¿Cómo definimos su cardinalidad? ¿Cuál es la cardinalidad de $\mathbb{R}$? ¿Es la misma que la de los reales positivos $\mathbb{R^+_0}$? ¿Y que la de los racionales $\mathbb{Q}$? ¿Y los naturales $\mathbb{N}$?

La respuesta corta es que _no_. Que los naturales, enteros y racionales están en una cardinalidad de infinitos y los reales están en otra categoría superior. ¿Cómo? Opcionalmente, al final del notebook, les dejamos de forma opcional un acercamiento superficial al tema.

## Operaciones sobre conjuntos

Como vimos en la sección anterior, muchas veces partiremos de un conjunto y luego le aplicaremos operaciones para generar otros, sea para acotarlos, para unirlos con otros o para simplemente describirlos.

### Intersección (entre dos conjuntos)

La intersección de dos conjuntos es el conjunto de los elementos que están en ambos en simultaneo. 
"

# ╔═╡ b980329c-70b2-11eb-11d5-edcccbb78bac
# Diagrama de Venn

# ╔═╡ bf63d29a-70b2-11eb-0201-814185021f0b
md"
Si los conjuntos intersecados se definen por intensión (por un criterio) la intersección serán los elementos que cumplen con ambos criterios: por ejemplo, el conjunto de los competidores de arquería del equipo de FIUBA es la intersección de dos conjuntos: el de personas que juega a arquería y el de personas que cursan ingeniería en FIUBA. 

$$\text{Equipo de Arquería de FIUBA} = \text{Practicantes de arquería} \cap \text{Estudiantes de FIUBA} $$

Lo cual también podríamos explicar con las condiciones:

$$\text{Practicantes de arquería} = \{x \in \text{Personas} / x\  \text{practica arquería}\}$$

$$\text{Estudiantes de FIUBA} = \{x \in \text{Personas} / x\  \text{estudia en FIUBA}\}$$

$$\text{Equipo de Arqueria de FIUBA} = \{x \in \text{Personas} / x\ \text{estudia en FIUBA} \land x\ \text{practica arquería}\}$$

#### Ejemplo de intersección en un problema

Esto se lee como \"el equipo de arquería de FIUBA es el conjunto de las personas que estudian en FIUBA y además practican arquería\".

Numéricamente usamos la intersección para acotar conjuntos ordenados como los reales. Por ejemplo, el conjunto de los mayores a 20 y los menores a 40.

$$C = \{x \in \mathbb{R} / 20 \lt x \lt 40\}$$

Este tipo de cosas suelen aparecer como soluciones a sistemas de ecuaciones. Imaginemos el caso de un tiro vertical descrito por la ecuación $h(t) = 1 - (t - 1)^2$.
"

# ╔═╡ dcc97300-70b2-11eb-18b9-71966ff843c9
begin
	t_h = collect(-5:0.01:5)
	h(t) = 1 - (t - 1)^2
	
    plot(t_h, h.(t_h), lab="h(t) = 1-(t-1)²", color=:red)
	xlabel!("t")
	ylabel!("h(t)")
    xlims!(0,2)
    ylims!(0,1.2)
	plot!([3/4], seriestype="hline", lab="", color=:green, style="dot")
end

# ╔═╡ e22caa5e-70b2-11eb-13c2-f58e7c96adee
md"
Como queremos filmar el evento, queremos saber cuándo el cohete estará por encima de cierta altura 3/4, como para no molestarnos en prender las cámaras en ese intervalo de tiempo. En notación matemática, nos interesa saber \"cuál es el conjunto de las $t$ para las cuales $h(t) \ge \frac{3}{4}$\". Resolviendo la inecuación:

$$1 - (t-1)^2 \ge \frac{3}{4}$$

$$- (t-1)^2 \ge -\frac{1}{4}$$

Recordemos que si multiplicamos por -1 a ambos lados de una ecuación, esto es equivalente a mover el término de la izquierda a la derecha y el de la derecha al de la izquierda, así que cambia de mayor o igual a menor o igual si las mantenemos en el mismo lugar.

$$(t-1)^2 \le \frac{1}{4}$$

$$\sqrt{(t-1)^2} \le \sqrt{\frac{1}{4}}$$

Aquí recordemos que si hacemos la raiz de algo al cuadrado, tenemos que poner el valor absoluto, ya que elevar al cuadrado nos hacía cualquier cosa positiva y eso nos hacía perder información.

$$|t-1| \le \frac{1}{2}$$"

# ╔═╡ f25e2da8-70b2-11eb-2531-d324a7e5d9a8
begin
	abs_t(t) = abs(t-1)
    plot(t_h, abs_t.(t_h), lab="|t-1|", color=:red)
	xlabel!("t")
	ylabel!("|t-1|")
    xlims!(0,2)
    ylims!(0,1.2)
	plot!([1/2], seriestype="hline", lab="", color=:green, style="dot")
end

# ╔═╡ f68de6f2-70b2-11eb-258c-354cf799d776
md"
Esto se traduce en dos restricciones en simultáneo:

$$\left\{
	\begin{array}{ll}
		t-1 \le \frac{1}{2} \rightarrow t \le \frac{3}{4} \\
		1-t \le \frac{1}{2} \rightarrow \frac{1}{2} < t
	\end{array}
\right.$$

Si aplicamos ambas restricciones, nos queda que el conjunto de $t$ que soluciona este problema es $T = \{t \in \mathbb{R}/ \frac{1}{2} \le t \le \frac{3}{4}\}$ o lo que es lo mismo, $T = [\frac{1}{2}, \frac{3}{4}]$

**Corolario**: pensemos en la cardinalidad de la intersección. Si $C = A \cap B$ eso significa que los elementos de $C$ tienen que estar en ambos conjuntos. Los elementos de $A$ que no están en $B$ y los de $B$ que no están en $A$, por lo tanto, *no* están en $A \cap B$. Otra forma de pensar esto, es que $C \subset A \land C \subset B$. Como consecuencia, para conjuntos finitos, $|C| \le |A| + |B|$. ¿Cuándo podría suceder que $|C| = |A| + |B|$? Solo en el caso de que $A$ y $B$ sean el mismo conjunto."

# ╔═╡ 047b9eee-70b3-11eb-12be-3990f3564113
# diagramas de Venn con A y B distintos o con A y B iguales

# ╔═╡ 0cdb1f56-70b3-11eb-0b32-d52aa52cc43e
md"
### Unión (entre dos conjuntos)

Si el conjunto $C$ es la unión entre otros dos conjuntos, $A$ y $B$, lo cual notamos $C = A \cup B$, esto significa que los elementos de $C$ son aquellos que pertenecen a $A$ o a $B$ (o a ambos) indistintamente. Dicho de otro modo: $A \cup B = \{x/ x\in A \lor x \in B\}$.

Esto típicamente se da cuando hay muchas características a cumplir y nos interesan los elementos que cumplan _al menos una_ de esas características. Por ejemplo, si pensamos a los estudiantes de cada carrera de ingeniería como un conjunto, (mecánica, informática, civil, electrónica y así hasta llegar a las 13), la unión entre todos esos nos da el conjunto de los estudiantes de ingeniería. Con que uno estudie alguna de esas, ya podemos decir que estudia ingeniería. 

Observemos que cuando decimos \"o estudia informática, o civil, o mecánica\", ese \"o\" no es exclusivo: alguien puede ser estudiante de informática y de electrónica, por ejemplo. Si bien los que comletan ambas carreras son como figuritas holográficas (muy difíciles de encontrar), existen muchos inscritos en ambas carreras para poder cursar materias de la otra por interés.

Para los números podemos pensar, por ejemplo, en los reales que son mayores a 75 o menores a 18. Este tipo de conjuntos numéricos unidos modelan conjuntos reales, como las personas que no trabajan (o bien porque están jubiladas o porque son menores de edad)."

# ╔═╡ 216e6928-70b3-11eb-1a4e-6d47309ef23c
md"
#### Ejemplo

Matemáticamente este tipo de problemas también es bastante típico de los sistemas de ecuaciones o inecuaciones cuando valen varios intervalos. Un caso típico son las funciones periódicas, como las trigonométricas:"

# ╔═╡ 26bbd94c-70b3-11eb-394d-2fdecd7a1b82
begin
	x_pos = vcat(collect(0:0.01:π), collect(2π:0.01:3π))
	x_neg = vcat(collect(-π:0.01:0), collect(π:0.01:2π))
	y_cruce = -0.5
	
    plot(x_pos, sin.(x_pos), lab="sen(x) donde sen(x) > 0", color=:blue, 
		legend=:bottomright)
	plot!(x_neg, sin.(x_neg), lab="sen(x) donde sen(x) < 0", color=:red)
    plot!([0], seriestype="hline", lab="",color=:black)
    plot!([0], seriestype="vline", lab="",color=:black)
	xlabel!("x")
	ylabel!("f(x)")
end

# ╔═╡ 2c36684c-70b3-11eb-172a-517434e3f626
md"
Para la función $sen(x)$, en el primer período ($[0,2\pi]$) sabemos que de $0$ a $\pi$ la función es positiva y de $\pi$ a $2\pi$ negativa. Para este primer período es fácil denotar cuál es el conjunto de los $x$ en el dominio tal que $sen(x)>0$. Esto es: $\{x \in [0, 2\pi] / sen(x) > 0\} = [0,\pi]$. El problema es cuando queremos notar a los $x$ donde $sen(x)$ es positiva en _todos_ los reales.

Como la función es periódica, sabemos que $sen(x + 2\pi) = sen(x)$ para cualquier $x$. Esto significa que si el intervalo $[0, \pi]$ hace positivo al seno, también lo hará el intervalo $[2\pi, 3\pi]$, el $[4\pi, \pi]$ y así. Entonces podríamos notar al conjunto que mencionabamos así:

$${x \in \mathbb{R} / sen(x) \ge 0} = [0, \pi] \cup [2\pi, 3\pi] \cup [4\pi, 5\pi] \cup ... \cup [-2\pi, -1\pi] \cup ...$$

Como vemos, este conjunto es la unión de infinitos conjuntos, ya que todo período tendrá una mitad positiva. Como es un poco incómodo notar de esta manera, a veces usamos una descripción por intensión también a la unión. En el caso anterior vemos que cada sección positiva puede expresarse como $[2\pi k, 2\pi k + \pi ]$ o $[2\pi k, \pi (2k + 1)]$.

Podemos expresar esto, entonces, así:

$$\bigcup_{k \in \mathbb{Z}}[2\pi k, \pi (2k + 1)]$$

Como notarán, esta es la misma notación que se usa para las sumatorias, solo que en lugar de sumar cada elemento, se une."

# ╔═╡ 3cad7008-70b3-11eb-29b5-db9538d40cee
md"
### Complemento (de un conjunto)

Llamamos el complemento de un conjunto a todos los elementos que no están en él. Matemáticamente, esto se nota $\overline{A} = \{x/x\notin A\}$

Si pertenecer a ese elemento significa cumplir una condición, su complemento son los elementos que no la cumplen. El conjunto de la gente que escucha heavy metal tiene su complemento, que es el de la gente que no lo escucha. Del mismo modo, el complemento de los números positivos + el cero ($\mathbb{R^+_0}$), tiene como complemento a los negativos ($\mathbb{R^-}$). Si no incluyéramos al cero, entonces el complemento serían los negativos y el cero.


#### Ejemplo

Recordemos el ejemplo que vimos de intersección. Queríamos ver en qué momentos el cohete estaría a una altura no filmable para apagar las cámaras. Pero probablemente querramos lo opuesto: saber en qué momentos podremos filmar. "

# ╔═╡ 5434512e-70b3-11eb-1c46-f57b15828c4e
begin
	t_arriba = collect(0.5:0.01:1.5)
	t_abajo_1 = collect(0:0.01:0.5)
	t_abajo_2 = collect(1.5:0.01:2.0)
    plot(t_arriba, h.(t_arriba), color=:red, label="h(t) para h > 3/4")
	plot!(t_abajo_1, h.(t_abajo_1), color=:grey, label="")
	plot!(t_abajo_2, h.(t_abajo_2), color=:grey, label="")
	title!("Arriba")
	xlabel!("t")
	ylabel!("h(t)")
    xlims!(0,2)
    ylims!(0,1.2)
	plot!([3/4], seriestype="hline", lab="", color=:green, style="dot")
end

# ╔═╡ 6cd47cd6-85b7-11eb-089c-93885c4ea903
begin
	plot(t_arriba, h.(t_arriba), color=:grey, label="")
	plot!(t_abajo_1, h.(t_abajo_1), color=:red, label="h(t) para h < 3/4")
	plot!(t_abajo_2, h.(t_abajo_2), color=:red, label="")
	xlabel!("t")
	ylabel!("h(t)")
	title!("Abajo")
    xlims!(0,2)
    ylims!(0,1.2)
	plot!([3/4], seriestype="hline", lab="", color=:green, style="dot")
end

# ╔═╡ 58e45b74-70b3-11eb-292e-d1db7e3a74fc
md"Si lo pensamos, $T$ era el conjunto de valores de tiempo donde no se podría filmar, y queremos los elementos que están afuera de ese conjunto, es decir, su complemento $\overline T$. Si quisiéramos, como ejercicio, podríamos hacer todas las cuentas desde el principio, partiendo de $1 - (t - 1)^2 < \frac{3}{4}$. 

Sin embargo, nosotros ya hicimos todas las cuentas y llegamos a que $T = \{t \in \mathbb{R}: \frac{1}{2} \le t \le \frac{3}{4}\}$. Como vimos hace un rato, esto en realidad es en verdad la intersección entre dos condiciones:


$$\frac{1}{2} \le t \land  t \le \frac{3}{4}$$

Los que hayan cursado sociedad y estado conocerán la Ley de Morgan, que nos ayudará a negar esto, pero para los que no, aquí la explicamos simplificadamente. Si nosotros tenemos que cumplir dos condiciones para pertenecer a un conjunto, con no cumplir aunque sea una, ya no pertenecemos al mismo. Para negar esa expresión, tendremos que pasar de la intersección de esas dos condiciones a la unión de las contrarias:

$$\frac{1}{2} > t \lor  t > \frac{3}{4}$$

Observemos dos cosas:

1) Negar una inecuación no es solo pasar de \"menor\" a \"mayor\" y viceversa. También hay que cambiar el borde: $\frac{1}{2} \le t$ incluye a $\frac{1}{2}$, así que su complemento no puede contenerlo, y por lo tanto es $\frac{1}{2} > t$.
2) El $\land$ se convierte en $\lor$, debido a la Ley de Morgan.

Entonces lo que antes era una intersección, o dicho de otro modo, que se cumplan dos criterios en simultáneo, pasó a ser, en la negación, la unión, o dicho de otro modo, de al menos una condición.

Esto se ve graficando:
"

# ╔═╡ 5f47fde0-70b3-11eb-236a-d9e25bdb7ce6
# gráfico comparativo entre valor absoluto negado y sin negar

# ╔═╡ 71901d66-70b3-11eb-3e69-87c693c97378
md"
## Puntos interesantes de un conjunto

### Máximos y mínimos globales

Algunos puntos de un conjunto son especialmente interesantes para trabajar, como los máximos y mínimos. Estos son, si los hay, los puntos \"más altos\" o \"más bajos\" del mismo.

Matemáticamente: 

$$max(A) = \{x \in A: \forall y \in A: x \neq y \Rightarrow y < x\}$$

Esto se lee \"el máximo global de un conjunto $A$ es un $x$ perteneciente a él tal que cualquier otro elemento y es menor a él\". Para el mínimo global, tenemos la definición inversa: 

$$min(A) = \{x \in A: \forall y \in A: x \neq y \Rightarrow y > x\}$$

¿Por qué son interesantes estos puntos? En esta materia nos interesarán estos puntos aplicados a funciones. Conocer el máximo de una función nos sirve en ejemplos como el tiro vertical que nombramos antes, para encontrar a qué altura máxima llega el cohete antes de comenzar su decenso."

# ╔═╡ 8845120a-70b3-11eb-0b08-bfd017c18f65
begin	
    plot(x_cuad, y_cuad(x_cuad), lab="y(x) = x²", color=:red)
	xlabel!("x")
	ylabel!("x²")
	scatter!([0], [0], label="mínimo", color=:green)
	ylims!(-0.2, 1)
	xlims!(-1,1)
end

# ╔═╡ 8cc1df84-70b3-11eb-3a36-3df76de9e0ff
md"Frecuentemente, nosotros no solo queremos el máximo o el mínimo de la función, que se calculan sobre la imagen, sino que nos interesa el punto del dominio $x$ para el cual $f(x)$ es mínimo o máximo. ¿Por qué? Porque frecuentemente el dominio contiene a la o las variables que podemos cambiar. Si la función representa el costo de producir una caja en función de sus dimensiones, podremos elegirlas bien para ahorrar gastos en la producción. Si la función representa el error que una inteligencia artificial comete en una predicción, encontrar la predicción para la cual el error es mínimo mejorará la performance de esa AI."

# ╔═╡ eccc1f90-85bc-11eb-1362-f76a0cfaa389
md"Hicimos dos estimaciones distintas. Veamos qué tan bien funciona cada una." 

# ╔═╡ 8848198c-85bc-11eb-3b79-eb6f4228a150
# Error cuadrático medio
error_cm(funcion, mediciones_x, mediciones_y) =
begin
	estimaciones = funcion.(mediciones_x)
	sum((estimaciones - mediciones_y).^2)/length(estimaciones)
end

# ╔═╡ 654e4118-85bc-11eb-22ab-ddf2eac3e04e
error_cm(y_estimado_1, x_est_lf, mediciones)

# ╔═╡ d29020f2-85bc-11eb-0de6-61da0496f2e0
error_cm(y_estimado_2, x_est_lf, mediciones)

# ╔═╡ 1f03efd2-85bc-11eb-10b9-cbc665ed3e6b
md"Podemos ver claramente que la segunda estimación es mejor que la primera, pero parecería que si subimos un poco más la pendiente podríamos generar una mejor. Para ver cuál es **la mejor** podemos graficar el error en función de la pendiente y buscar el mínimo:"

# ╔═╡ f7d9c0a2-85bc-11eb-2b1a-45f9efa82172
begin	
	estimador_con_pendiente(p) = x -> p*x
	pendientes = collect(0:0.03:6)
	error_cm_para_mediciones(funcion) = error_cm(funcion, x_est_lf, mediciones)
	estimadores = estimador_con_pendiente.(pendientes)
	errores = error_cm_para_mediciones.(estimadores)
    plot(pendientes, errores, label="error(pendiente)")
	scatter!([3], [error_cm_para_mediciones(estimador_con_pendiente(3))], 
		label="Error para f(x)=3x")
	xlabel!("pendiente")
	ylabel!("error")
end

# ╔═╡ 9665f80e-70b3-11eb-2e39-c5abbe51e8da
md"Podemos ver que que la función que minimiza el error es $f(x)=3x$, es decir, la pendiente 3, con lo cual tenemos el mejor estimador posible.

Como siempre, en ingeniería, nos interesa llegar a un resultado a fin de tomar las mejores decisiones. Por eso llamamos _optimizar_ a buscar el mínimo o el máximo de una función.
"

# ╔═╡ 9bb234a8-70b3-11eb-1e50-756505f95bb0
md"
#### ¡El dominio es importante!

Veamos un problema más real de este estilo. Imaginemos que tenemos que fabricar cajas cuadradas a partir de una pieza de cartón de 10 cm de lado, la cual cortamos y plegamos para formar la caja.

_insertar dibujo similar a [este](https://www.geogebra.org/resource/dzSPfvRZ/vzUqY8DCjv2JRHfE/material-dzSPfvRZ.png)_

Queremos fabricar la caja de mayor volumen posible con esas piezas de cartón. ¿Qué dimensiones deberá tener? 

- Para resolver este problema, primero nos conviene dibujarlo para entenderlo mejor.

- Luego, describimos el problema con una función. El volumen de la caja (el valor que queremos maximizar) está dado por:

$$V = base \cdot altura \cdot profundidad$$

La base, altura y profundidad dependerán de cuán grandes sean los 4 cuadrados que recortemos de las esquinas del cartón.

$$base = 10 - 2x$$

$$profundidad = 10 - 2x$$

$$altura = x$$

Hay algo clave a ver aquí: tenemos un mínimo y un máximo para recortar. No podemos recortar un cuadrado negativo y no podemos cortar más que lo que tenemos. Por lo tanto, nuestra función $V(x)$ tiene un dominio restringido: $x \in (0,5)$.

$$V(x) = altura \cdot base \cdot profundidad = x(10-2x)(6-2x) = 100x - 40x^{2} - 4x^{3}$$
"

# ╔═╡ ab6724b0-70b3-11eb-0f00-a50234b2a1db
# gráfico

# ╔═╡ b1c08b64-70b3-11eb-1a28-cd1146e30704
md"
Aquí vemos claramente lo importante de restringir el dominio: si no lo hacíamos, la imagen no habría estado acotada y por lo tanto no habría habido máximo.

Para encontrar el máximo de esta función nos interesa ver cuál es la pendiente de la función en cada punto, lo cual aprenderemos a obtener con la derivada en unidades posteriores. Además, como veremos, en particular nos interesa que la derivada sea nula.

$$\frac{dV}{dx} = 100x - 40x^{2} - 4x^{3} = 0$$

Resolviendo esta ecuación hallaremos el valor de x que maximiza V, es decir, el tamaño que debemos recortar (y que determina la base, profundidad y altura) que genera la caja con el mayor volumen.

Recordemos entonces que el máximo de la función es ... porque la imagen es $[0, ...]$. A nosotros para tomar decisiones nos interesa el punto del dominio donde se _realiza_ ese máximo, que es $...$.
"

# ╔═╡ be827554-70b3-11eb-0537-17e2ecd54cd9
md"
[El gráfico interactivo que hay acá es buenísimo, ver si podemos hacer algo similar](https://www.geogebra.org/m/VmBdhhtx)"

# ╔═╡ c64bcdac-70b3-11eb-3be6-b991f69c908e
md"
### Máximos globales vs locales

(puede que esto convenga mandarlo directamente a derivadas, no es un tema de conjuntos ahora que lo veo)

Todos los máximos o mínimos que mostramos antes eran globales (mayores o menores a todos los otros puntos). Si no hubiéramos acotado la función $V(x)$ del problema de las cajas, el conjunto imagen habría sido $\mathbb{R}$, que no tiene ni mínimo ni máximo (no está acotada). Sin embargo, el punto $x =...$ seguiría siendo bastante interesante, ¿no? Desde luego. Este tipo de puntos se llaman máximos locales. De hecho, las derivadas nulas nos sirven para calcular ciertos tipos de máximos y mínimos locales.

Los máximos y mínimos globales no se comparan respecto a todo el conjunto, sino a los puntos que están a su alrededor, o su \"entorno\" al que pertenecen. El entorno de un punto se define como:

$$h_r(a) = \{b \in A : |b - a| < r\}$$

Es decir, un entorno de tamaño $r$ es, para ese $a$, todos los puntos $b$ que están a una distancia menor a $r$. Si encontramos un $r$ lo suficientemente pequeño para que $a$ sea el más grande, entonces $a$ es un máximo local. Esto que acabamos de decir, matemáticamente se nota:

$$f(a) \text{ es máximo local de } f \Leftrightarrow \exists r / \forall b \in h_r(a) : f(b) < f(a)$$"

# ╔═╡ d3c09cfe-70b3-11eb-1bf1-b9a7f2c43799
md"
### Supremos e ínfimos

Veamos un caso interesante. ¿Tiene un mínimo la función $f: \mathbb{R}^+ \rightarrow \mathbb{R}: f(x) = \frac{1}{x}$?

Grafiquemos para ver de qué se trata la pregunta."

# ╔═╡ d73813da-70b3-11eb-2cc1-335a8db0e308
begin
	x_inv = collect(0.01:0.01:20)
	inversa(x) = 1/x
    plot(x_inv, inversa.(x_inv), color=:red, label="f(x) = 1/x")
	xlabel!("x")
	ylabel!("1/x")
	ylims!(0, 4)
end

# ╔═╡ da308fce-70b3-11eb-237e-3de4ca59e37d
md"La respuesta, como se imaginarán, es _no, pero casi_. Claramente se puede ver que no tenemos ningún punto que sea menor a $0$. Pero entonces, ¿$0$ no es el mínimo? Recordemos la definición estricta de mínimo:

$$min(A) = \{x \in A: \forall y \in A: x \neq y \Rightarrow y > x\}$$

Si nos fijamos, para que $0$ sea mínimo de la función tiene que pertenecer a la imagen, y sin embargo no existe ningún $x$ para el cual $f(x) = 0$. Para ser precisos, la imagen de esta función es $(0, \infty)$. Ese intervalo abierto en $0$ es lo que nos causa problemas.

Esto que encontramos sigue siendo relevante y tiene nombre. El 0 se llama \"ínfimo\", ya que es el número más alto que acota inferiormente a nuestro conjunto. Digamos, $-5$ también acota inferiormente a la imagen, pero no tiene nada de especial.

De este modo quedan definidos nuestros \"casi\" máximos y mínimos, el supremo y el ínfimo. El primero es la más baja cota superior, y el segundo es la más alta de las cotas inferiores.

Ojo: es importante tener en cuenta que los máximos y mínimos, cuando existen, **son** los supremos e ínfimos respectivamente.
"

# ╔═╡ e78bb7e6-70b3-11eb-2171-13723c777b3c
md"
### ¡Cuidado con los valores repetidos!

¿Qué pasa si tenemos una función con meseta?

$$f: \mathbb{R} \rightarrow \mathbb{R} / f(x) =
\left\{
	\begin{array}{ll}
		x  \text{ para } x \in (-\infty,1] \\
		1  \text{ para } x \in (1,2) \\
        3-x  \text{ para } x \in [2, \infty)
	\end{array}
\right.$$"

# ╔═╡ 0f0229fe-70b4-11eb-3a77-b1e50b9bd3a7
f_con_meseta(x) = begin
	if(x <= 1)
		x
	elseif(x >= 2)
		3 - x
	else
		1
	end
end

# ╔═╡ a08e9fec-85c5-11eb-04d3-3902bce7da52
begin
	x_meseta = collect(-1:0.01:3)
    plot(x_meseta, f_con_meseta.(x_meseta), color=:red, label="f_con_meseta(x)")
	xlabel!("x")
	ylabel!("f_con_meseta(x)")
end

# ╔═╡ 13a108fe-70b4-11eb-11e4-8bd9206fcbbe
md"
¿Cuáles son los máximos y los mínimos? Claramente no tenemos mínimos, ya que la función puede ser tan pequeña como querramos a medida que vayamos hacia $\infty$ o $-\infty$ en el dominio. ¿Tenemos un máximo? Uno podría confundirse y pensar \"¡No! No tengo ninguna colina, ni nada por el estilo\". Bueno, siempre ante la duda volvemos a la definición. 

$$max(A) = \{x \in A: \forall y \in A: x \neq y \Rightarrow y < x\}$$

Si nos fijamos, nuestra imagen es $(-\infty, 1]$, con lo cual, sin hacer cuentas, nos damos cuenta que el máximo _existe_ y es $1$. La pregunta que es más difícil de responder es _a dónde se realiza ese máximo_, y eso es, para cualquier $x \in [1,2]$."

# ╔═╡ 2714571a-70b4-11eb-1a68-99c08bf041c3
md"
### ¡Cuidado con los extremos del dominio!

Si a la misma función le acotamos el dominio, por ejemplo, entre $0$ y $3$, tenemos que volver a ver si hay o no mínimos y máximos!"

# ╔═╡ 2d9eeb7c-70b4-11eb-12ac-c3a40d6a05a9
# gráfico

# ╔═╡ 2fdce4d4-70b4-11eb-3c97-35f7228ac0ec
md"
El máximo vemos que sigue siendo el mismo. Pero... ¿Y el mínimo? Bueno, antes no teníamos mínimo, porque la imagen era $(-\infty, 1]$, pero ahora a simple vista podemos ver que es $[0, 1]$, así que $0$ es nuestro mínimo, y se _realiza_ en $x=0$ y en $x=3$.

Las funciones pueden tener (o no) máximos y mínimos locales y absolutos."

# ╔═╡ 35b2d724-70b4-11eb-0669-c792f490da56
md"
>> Poner un gráfico [así](https://lh4.googleusercontent.com/acJTgbl8eGDScb2YfUdSwfqam82XHqtApGnBpTY5HXNc797O_yMeNr4OzTJnn3b2IXE741G3wkN8RHHFuhVk-DGv6C4ypEeUZXA7tYGwPpJqismYOtw3CnhX1mT-iBPdeg8ZVi4)"

# ╔═╡ 3ceb481e-70b4-11eb-33cc-2109e8732503
md"
Esta función

$$-x^3 + 3x$$

tiene un máximo local y un mínimo local pero no tiene máximo ni mínimo absoluto (ya que tiende a más infinito y menos infinito)
>> robar gráfico de acá (solamente la mitad izquierda) https://d2vlcm61l7u1fs.cloudfront.net/media%2F961%2F9616ceff-90ab-43e6-86f3-40ce1bcd2f13%2FphpqbijeZ.png


¿Esta función tiene máximo?

$$x = 3$$

No, pero tiene algo llamado _supremo_.
El supremo es 

>> https://totumat.com/2020/08/09/supremo-e-infimo-de-una-sucesion/

- Funciones monótonas crecientes y decrecientes."

# ╔═╡ 54f6b362-70b4-11eb-283d-3da95d948fd2
md"
## Opcional: Cardinalidad de los Infinitos

Este es un tema extremadamente complejo, pero puede resumirse informalmente a que, si bien todos estos conjuntos tienen \"infinitos\" elementos, no tienen la misma cardinalidad. Algunos son \"más infinitos\" que otros. ¿Cómo los comparamos?

Georg Cantor, un matemático Ruso de fines del siglo XIX fue el primero en notar que los números naturales y los reales no tenían una infinidad del mismo grado, y llamó $\aleph_0$ (que se lee como \"alef 0\") a la cardinalidad de los naturales y los racionales, y $\aleph_1$ a la de los reales. $\aleph$ es la primera letr del alfabeto hebreo. Tal vez en estas cardinalidades infinitas se haya inspirado Borges al escribir su cuento El Aleph, sobre un punto desde donde se ve todo el universo.

¿En qué se diferenciaron $\aleph_0$ y $\aleph_1$? ¿Por qué uno es \"más infinito qué otro\"? Bueno, para esto primero tenemos que saber qué significa que un infinito sea igual o \"equipotente\" a otro.

Cantor decía, por ejemplo, que los enteros $\mathbb{Z}$ son equipotentes a los naturales, $\mathbb{N}$. ¿Por qué? Porque para cada elemento de $\mathbb{N}$ podemos asignar uno de $\mathbb{Z}$ y vice versa. Es decir, podemos establecer una _biyectividad_. ¿Cómo? Aquí mostramos un ejemplo:

$$f: \mathbb{N} \rightarrow \mathbb{Z} / f(n) =
\left\{
	\begin{array}{ll}
		-\frac{n}{2}  & \mbox{si } x \text{ es par} \\
		\frac{n+1}{2} & \mbox{si } x \text{ es impar}
	\end{array}
\right.$$

Esto es, con los impares 1, 3, 5... vamos generando los positivos 1, 2, 3... mientras que con los pares 0, 2, 4, 6... vamos generando los negativos y el 0, -1, -2, -3...

Esto significa que los naturales y los naturales positivos son \"igual de infinitos\", porque para cada número entero tiene un número real asignado y vice versa. Podríamos armar la siguiente tabla:



| $\mathbb{Z}$ | $\mathbb{N_0}$ |
| -------- | -------- |
| $1 = \frac{1+1}{2}$     | 1     |
| $2 = \frac{3+1}{2}$     | 3     |
| $3 = \frac{5+1}{2}$     | 5     |
| $4 = \frac{7+1}{2}$     | 7     |
| ...    | ...     |
| $\ \ \ 0 = -\frac{0}{2}$     | 0     |
| $-1 = -\frac{2}{2}$     | 2     |
| $-2 = -\frac{4}{2}$     | 4     |
| $-3 = -\frac{6}{2}$     | 6     |
| ...    | ...     |

Podríamos seguir completando esta tabla infinitamente y veríamos que para cualquier entero existe un natural que puede transformarse en él con esta función que definimos.

Esto es interesante, porque significa que aunque intuitivamente los enteros sean \"el doble\" en cantidad que los naturales, esto no cambia el orden de infinito. Ambos son igual de infinitos. Más antiintuitivamente aún, los naturales son también equipotentes a los racionales. Podemos hacer una función que vaya de los naturales a los racionales y viceversa, aunque es un poco más complicada que la anterior.

Para que un infinito sea **más grande** que otro, debe poderse hacer una función inyectiva desde uno a otro, pero no del segundo al primero. Esto es lo que pasa con los reales: podemos crear una función que vaya de ellos a los racionales, pero no al revés. 

De forma un poco más intuitiva, ¿Cuál es la consecuencia tangible de qué los reales tengan una cardinalidad mayor a la de los racionales? Si bien hay infinitos números racionales entre cada para de enteros, por ejemplo entre el 0 y el 1, estos dejan \"agujeros\". Por ejemplo, $\sqrt2$ es un agujero porque no tiene ninguna representación racional: no es el cociente de dos enteros. Los reales no tienen agujeros. \"Llenan\" toda la recta, y por eso decimos que es un conjunto _denso_.


## Bibliografía recomendada
- Conjuntos (Alguien recomendó \"book of proof\" de richard hammack)."

# ╔═╡ Cell order:
# ╟─3b692fd0-85b1-11eb-1739-6d11326f0586
# ╟─34c94b8e-70b1-11eb-1775-4392b3a4032a
# ╟─5fedab20-70b1-11eb-2ab7-fd9463ced740
# ╠═a74b1bce-70b1-11eb-0b22-ef4dfbbebd07
# ╟─ab15a4a4-70b1-11eb-38a6-5776a5796ff9
# ╠═b1e86bf4-70b1-11eb-0fed-3322d236a1ff
# ╟─bb4bfd5a-70b1-11eb-38c4-e36b2f2fc66f
# ╠═ce00ce08-70b1-11eb-2244-8ff341cfd2da
# ╟─d517e528-70b1-11eb-1c5c-bf7e4d27fd17
# ╟─e01e3a30-70b1-11eb-2aaa-d101b975658b
# ╟─df615b04-70b1-11eb-00f4-87872e446742
# ╠═2f51d17c-70b2-11eb-0c06-6dcf65cd5580
# ╠═1797499c-85b2-11eb-074c-07e0ce4dc06c
# ╠═35dc7b8e-85b2-11eb-279a-653cd745be7f
# ╠═3f3375b6-85b2-11eb-1ebc-990600298754
# ╠═40c57c26-85b2-11eb-1d3c-a5cde1dfec02
# ╠═43e0b51a-85b2-11eb-2b29-a93ab9292f97
# ╟─34525a0a-70b2-11eb-0028-2d8d25e79a58
# ╟─5220da64-70b2-11eb-3aa6-a99d50dd3cb5
# ╟─72d450da-70b2-11eb-0354-61dd5772357f
# ╟─85e6e57a-70b2-11eb-2485-91b7963071a0
# ╠═b980329c-70b2-11eb-11d5-edcccbb78bac
# ╟─bf63d29a-70b2-11eb-0201-814185021f0b
# ╠═dcc97300-70b2-11eb-18b9-71966ff843c9
# ╟─e22caa5e-70b2-11eb-13c2-f58e7c96adee
# ╠═f25e2da8-70b2-11eb-2531-d324a7e5d9a8
# ╟─f68de6f2-70b2-11eb-258c-354cf799d776
# ╠═047b9eee-70b3-11eb-12be-3990f3564113
# ╟─0cdb1f56-70b3-11eb-0b32-d52aa52cc43e
# ╟─216e6928-70b3-11eb-1a4e-6d47309ef23c
# ╠═26bbd94c-70b3-11eb-394d-2fdecd7a1b82
# ╟─2c36684c-70b3-11eb-172a-517434e3f626
# ╟─3cad7008-70b3-11eb-29b5-db9538d40cee
# ╠═5434512e-70b3-11eb-1c46-f57b15828c4e
# ╠═6cd47cd6-85b7-11eb-089c-93885c4ea903
# ╟─58e45b74-70b3-11eb-292e-d1db7e3a74fc
# ╠═5f47fde0-70b3-11eb-236a-d9e25bdb7ce6
# ╟─71901d66-70b3-11eb-3e69-87c693c97378
# ╠═8845120a-70b3-11eb-0b08-bfd017c18f65
# ╟─8cc1df84-70b3-11eb-3a36-3df76de9e0ff
# ╠═9273a9e4-70b3-11eb-177b-a5e7c3e025ad
# ╟─eccc1f90-85bc-11eb-1362-f76a0cfaa389
# ╠═8848198c-85bc-11eb-3b79-eb6f4228a150
# ╠═654e4118-85bc-11eb-22ab-ddf2eac3e04e
# ╠═d29020f2-85bc-11eb-0de6-61da0496f2e0
# ╟─1f03efd2-85bc-11eb-10b9-cbc665ed3e6b
# ╠═f7d9c0a2-85bc-11eb-2b1a-45f9efa82172
# ╟─9665f80e-70b3-11eb-2e39-c5abbe51e8da
# ╟─9bb234a8-70b3-11eb-1e50-756505f95bb0
# ╠═ab6724b0-70b3-11eb-0f00-a50234b2a1db
# ╟─b1c08b64-70b3-11eb-1a28-cd1146e30704
# ╟─be827554-70b3-11eb-0537-17e2ecd54cd9
# ╟─c64bcdac-70b3-11eb-3be6-b991f69c908e
# ╟─d3c09cfe-70b3-11eb-1bf1-b9a7f2c43799
# ╠═d73813da-70b3-11eb-2cc1-335a8db0e308
# ╟─da308fce-70b3-11eb-237e-3de4ca59e37d
# ╟─e78bb7e6-70b3-11eb-2171-13723c777b3c
# ╠═0f0229fe-70b4-11eb-3a77-b1e50b9bd3a7
# ╠═a08e9fec-85c5-11eb-04d3-3902bce7da52
# ╟─13a108fe-70b4-11eb-11e4-8bd9206fcbbe
# ╟─2714571a-70b4-11eb-1a68-99c08bf041c3
# ╠═2d9eeb7c-70b4-11eb-12ac-c3a40d6a05a9
# ╟─2fdce4d4-70b4-11eb-3c97-35f7228ac0ec
# ╟─35b2d724-70b4-11eb-0669-c792f490da56
# ╟─3ceb481e-70b4-11eb-33cc-2109e8732503
# ╟─54f6b362-70b4-11eb-283d-3da95d948fd2
