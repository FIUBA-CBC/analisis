### A Pluto.jl notebook ###
# v0.12.12

using Markdown
using InteractiveUtils

# ╔═╡ 57c122b6-5394-11eb-3970-75f46fb55ac4
md"# 1.3. Características de funciones

## Funciones inversas y sus requisitos

### Intuición

Para muchas aplicaciones el ingenier@ puede necesitar definir una función inversa de una función dada. Una función inversa es aquella que, conocida una relación $f(x)=y$, su función inversa $f^{-1}(y)=x$ relaciona los valores de la función, \"las $y$\", con los valores de lo que era nuestra variable independiente, \"las $x$\". Por ejemplo:

- Teniendo una función de posición $x(t)$, averiguar en qué momento se pasa por un punto en particular: $t(x_0)$.
- Teniendo una función de consumo eléctrico según metros de cable $c(m)$, averiguar cuántos metros de cable puede tener nuestra red dependiendo de cuánto consumo tolera nuestra central eléctrica: $m(c)$.

¿Se puede invertir toda función? La función $x^2$, por ejemplo, es invertible?"

# ╔═╡ 91290ffc-5394-11eb-27a0-179e75f62ae7
# plot de $x^2$ y de $x^2$ rotado

# ╔═╡ 906f8a00-5394-11eb-07f3-7f9633d5b1bb
md"
Antes de entrar en definiciones formales, veamos estos gráficos y pensemos si esta nueva relación que surge de invertir las $x$ y las $y$ \"parece\" una función según las definiciones que vimos en el punto 1.2. Te recomendamos tomarte un momento para tratar de descubrir las dos razones por las que esta gráfica no cumple la definición.

Dijimos en el punto 1.2 que para decir que una relación sea una función, el resultado de aplicar la función para un valor determinado debía ser único, y llamamos a esta característica unicidad. Viendo la gráfica podemos observar que para todo valor de $y>0$, hay dos valores posibles de $x$, un valor positivo y un valor negativo. Entonces esta relación no cumple la condición de unicidad, y por lo tanto no es una función.

Por otro lado, para todos los valores de $y<0$, no hay ningún valor de x asignado, porque no existe en los reales un número que elevado al cuadrado nos de un resultado menor a cero. Entonces, tampoco cumple esta relación la condición de existencia del valor de la función para todos los $y \in \mathbb{R}$.

Podemos ver entonces que las funciones van a requerir un par de características para poder invertirse, que vamos a poder definir claramente en los siguientes párrafos."

# ╔═╡ a3e63a02-5394-11eb-1998-ddf95c42b883
md"
### Inyectividad

Lo primero que observamos es que, para que una función $f(x)$ sea invertible necesitamos, informalmente hablando, que no repita valores para distintos $x$. Esto es fundamental porque si rotamos la gráfica de una función que repite valores, vamos a tener para un mismo $x$, varios $y$. Es decir, no cumple con el requisito de _unicidad_ que vimos en el primer apunte.

Un ejemplo de función inyectiva es la exponencial."

# ╔═╡ af0a24f2-5394-11eb-3088-ef7f8d39976d
# gráfico de exponencial

# ╔═╡ c17c27b6-5394-11eb-2cfe-0f20790ba851
md"
Podemos ver que a medida que avanzamos hacia la derecha en x la función se hace cada vez más grande y nunca vuelve. Si vamos hacia la izquierda el valor se hace más pequeño. Si bien nunca llega al 0, cada vez se acerca más.

Contrastando, las cuadráticas, como vimos en la introducción, no son inyectivas. Pensemos en un tiro vertical de una pelota:
"

# ╔═╡ c5e02adc-5394-11eb-1f62-d5a900d8277f
# gráfico de un tiro vertical

# ╔═╡ cce85ae8-5394-11eb-208e-f3cb40ff5b6b
md"
Si nosotros arrojamos una pelota hacia arriba sabemos que en algún momento llegará a la altura de donde la lanzamos. De hecho, salvo para el punto máximo, pasará por cada punto dos veces.

Esto no aplica solo a funciones sobre el tiempo, sino sobre el espacio. Observemos esta sección del aconcagua:
"

# ╔═╡ cffc9744-5394-11eb-29b8-29d1e2595731
# sección de la coordillera de los Andes

# ╔═╡ d824731a-5394-11eb-3118-bf5202cb32b5
md"
Podemos fácilmente ver que, cerca de la cima de una montaña, si nos vamos hacia un lado o hacia el otro habrá muchas posiciones que tienen la misma altura. Esto es precisamente porque es un máximo local, como contamos en la sección pasada. 

De hecho, los mapas topográficos aprovechan a la repetición para asignar colores a todos los puntos con la misma altura. Si bien se va del alcance de la materia, es interesante pensar en que estos mapas son funciones que toman una latitud y una longitud y devuelven un color, o una altura: $h(lat, long)$. Estas funciones se verán en materias futuras, como Análisis II. 
"

# ╔═╡ e2295fec-5394-11eb-39ed-adb18e08b0a3
md"
#### Definición Matemática

Volvamos a funciones que toman una sola variable que son más fáciles de pensar. ¿Cómo modelamos esto matemáticamente? La forma de decir que dos valores de $f$ no se repiten para distintos $x$ es que 

 $f(x)$ es inyectiva si y solo si para todo $x_1 , x_2 \in Dom(f)$, si $f(x_1) = f(x_2)$ entonces $x_1 = x_2$ .

O lo que es lo mismo:

 $f(x)$ es inyectiva si y solo si para todo $x_1 , x_2 \in Dom(f)$, si $x_1 \not= x_2$, entonces $f(x_1) \not= f(x_2)$.

Básicamente son dos formas de ver lo mismo:

- Si encontramos dos $x$ donde $f(x)$ vale lo mismo, significa que son el mismo $x$.
- Para dos valores distintos de $x$ encontraremos necesariamente $f(x)$

Si bien la primera interpretación es más difícil de leer, a veces es más útil para probar.
"

# ╔═╡ efde60c4-5394-11eb-159b-d1667ea62c3c
md"
#### Prueba de inyectividad

Ver la gráfica de una función es importante para probar que es inyectiva, pero no es suficiente. Veamos el ejemplo más clásico, la lineal $f(x) = 5x - 10$:
"

# ╔═╡ 05bc6ea4-5395-11eb-2f8c-e5430def4de7
# Grafico

# ╔═╡ 188135a6-5395-11eb-3d2e-274357cbcb24
md"
Es evidente que no repite valores, pero deberíamos mostrarlo matemáticamente con la primera de las definiciones que vimos. Asumimos que hay dos puntos distintos de $f$ que valen lo mismo (no sucederá, podemos quedarnos tranquilos, ya llegaremos a eso):

$$f(x_1) = f(x_2)$$

$$5 x_1 - 10 = 5 x_2 - 10$$

$$5 x_1 = 5 x_2$$

$$x_1 = x_2$$

Precisamente llegamos a lo que pensábamos. La única forma de que dos valores de la función sean iguales es que estemos evaluando a la función sobre el mismo punto.
"

# ╔═╡ 1e75c7c4-5395-11eb-3f7f-21c8dc5d8982
md"
#### Prueba de no-inyectividad

Recordemos que la inyectividad es una propiedad que se debe cumplir para _toda_ la función. Para probar que una función no es inyectiva entonces basta encontrar un lugar donde no se cumple. Para este caso puntual, sería encontrar _dos_ $x$ _distintos_ donde la función vale lo mismo.

Por ejemplo, para $x^2$:
"

# ╔═╡ 291aa2d0-5395-11eb-0938-b355089f8303
md"

Podemos ver que 

$$f(4) = 4^2 = 16$$

$$f(-4) = (-4)^2 = 16$$

No hace falta más prueba que esta. Encontramos dos puntos distintos cuyos valores de $f$ son el mismo. Con esto mostramos que la función _no es inyectiva_.

La función lineal es muy fácil para operar. Para otras será importante conocerlas bien y tener presente la gráfica o su forma general. Por ejemplo, para la función coseno:
"

# ╔═╡ 3675ca40-5395-11eb-0fa4-958a41909abe
# Plot de la función coseno

# ╔═╡ 3e567aca-5395-11eb-13c2-4722d715ef17
md"
Evidentemente la función es periódica. No solo repite valores, sino que repite **todos** sus valores infinitas veces. ¿Cómo lo probamos matemáticamente? Como antes, basta con encontrar dos valores, como $0$ y $2\pi$, para los cuales el coseno vale $1$ (su valor máximo).

Esto aplica para cosenos de cualquier frecuencia:
"

# ╔═╡ 47a461a0-5395-11eb-13f1-e31932db7f69
# gráfico donde varíe la frecuencia del coseno

# ╔═╡ 4f7f9412-5395-11eb-125e-b944e3e51439
md"
$$cos(\omega x) = cos(\omega x + 2\pi\omega)$$

Tanto es así, que esta es la definición que se usa para cualquier función periódica: decimos que $f(x)$ es periódica si y solo si $f(x) = f(x + T)$ para todo $x$, donde $T$ es el _período_ de la función.
"

# ╔═╡ 59214df8-5395-11eb-08f7-01bffd778585
md"
### Sobreyectividad

En la sección anterior decíamos que necesitábamos la inyectividad porque nos permitía que la inversa cumpla la **unicidad**, que es un requisito para ser función. Sin embargo, nos falta el otro requisito: la **existencia**.

Recordando la primera sección, la existencia significa, para una función $f: \mathbb{R} \rightarrow \mathbb{R}$, que para cualquier $x \in \mathbb{R}$ habrá un $f(x)$.

Si lo pensamos en términos gráficos, para que la inversa _exista_ para todo $x$ (que \"cubra todo el dominio\"), necesitamos que $f$ \"cubra toda la imagen\". De lo contrario, al \"rotar\" la gráfica nos quedarán puntos x sin valor. Por ejemplo:

$x^3 - x$
"

# ╔═╡ 78346d60-5395-11eb-356b-7b6079466bfb
# Gráfico de la función

# ╔═╡ 54bb5bb4-5395-11eb-065c-b5f101121fd8
md"
Esta función \"cubre\" toda la imagen. Si nos vamos hacia la derecha, podemos obtener valores tan grandes como querramos, y si nos vamos a izquierda, valores tan pequeños como querramos. Esto de \"alejarse/acercarse tanto como uno quiere\" es un concepto que retomaremos cuando veamos límites. En el medio podemos ver que todos los valores cercanos a cero se cubren también. Intuitivamente, ya nos estamos dando cuenta que **es sobreyectiva**.

¿Esto significa que $x^3 - x$ es invertible? **NO**. Los que no hayan estado prestando atención tal vez se hayan olvidado de verificar inyectividad. Mirando la gráfica podemos observar que $f(1) = f(-1) = 0$, lo cual se verifica fácilmente haciendo la cuenta. Al rotar, podemos ver que si bien \"cubrimos todo $x$\" (gracias a que es sobreyectiva) tendremos el problema de que para ciertos valores, como el $0$, tendremos más de un valor posible, con lo cual **no tenemos unicidad**.
"

# ╔═╡ 901fdfae-5395-11eb-239d-21578a4d1c52
md"
#### Definición matemática

Si $f$ es una función $\mathbb{R} \rightarrow \mathbb{R}$, queremos que si elegimos el valor correcto de $x$ y hacemos $f(x)$ queremos ser capaces de obtener cualquier número real. Es decir:

Para cualquier $y \in Codom(f)$ existe un $x \in Dom(f)$ tal que $f(x) = y$.

Dicho de otra manera, queremos que la imagen (resultados posibles de f) sea lo mismo que el codominio (el espacio sobre el cual se asienta la imagen). Si $f: \mathbb{R} \rightarrow \mathbb{R}$ queremos que la Imagen sea exactamente $R$.
"

# ╔═╡ a408db22-5395-11eb-2ec8-ad8ffa782e5e
md"

#### Prueba de sobreyectividad

Volviendo al ejemplo lineal, si $f(x) = 5x - 10$, queremos que para todo punto $y = f(x)$ ver que exista un x. Literalmente, verificar la **existencia** de la inversa (no así su unicidad) para cada punto de y.

Formalmente:

$$y = f(x)$$

$$y = 5x - 10$$

$$\frac{y + 10}{5} = x$$

Aquí básicamente calculamos la función inversa en el camino, pero si seguimos pensando en sobreyectividad, lo que acabamos de hacer es encontrar la forma de obtener, para cualquier $y$ arbitrario que elijamos, un $x$ al que si le aplicamos $f$ obtenemos ese $y$. Es decir, cubrimos la imagen.

Quien esté leyendo atentamente pensará \"pero nos están estafando, porque si calculamos la inversa, ya sabemos que es sobreyectiva e inyectiva\". No podemos hacer otra cosa que darle la razón.

En la práctica, uno:
- O bien calcula la inversa.
- O bien prueba que algo no es sobreyectivo.
- O bien usa otras técnicas que veremos más adelante para describir la función y deducir que es sobreyectiva.

Esto último es lo que hicimos verbalmente con la función cúbica de hace unas secciones:
"

# ╔═╡ b54b0dee-5395-11eb-2386-b1bd3d67bd4e
# Gráfico de la cúbica de nuevo

# ╔═╡ 87fd0e96-5395-11eb-1272-a380b4042949
md"
Separamos esto en tres secciones:

- La primera es $x \in (-\infty, -1)$. Vemos que $f(-1) = (-1)^3 - (-1) = 0$ y que hacia izquierda la función _es decreciente_. Esto nos cubre todos los valores de $f$ en $(-\infty, 0]$.
- La tercera es $x \in (2, \infty)$. Vemos que $f(1) = 1^3 - 1 = 0$ y que a la derecha la función es creciente. Aquí entonces cubrimos todos los valores de $f$ en $[0, \infty)$.

Con esto podemos ignorar completamente la sección del medio porque ya probamos que nuestra imagen cubre el codominio, pues $(-\infty, 0] \cup [0, \infty) = R$.
"

# ╔═╡ c549304a-5395-11eb-06ee-23f468475a76
md"
#### Prueba de no-sobreyectividad

Al igual que probar la no-inyectividad de la función, basta con encontrar un valor que no podemos generar con nuestra $f$ para probar que no es sobreyectiva.

Por ejemplo, sabemos que $x^2 > 0$. Por lo tanto, para $f: \mathbb{R} \rightarrow \mathbb{R}$ con $f(x) = x^2$ si tomamos $y=-1$ no existe ningún $x$ tal que $f(x) = -1$. Eso es si trabajamos en los números reales, pues existen otros conjuntos (los números complejos) donde esa cuenta _tiene_ solución y es $f(x) = i$.

Si bien el tema excede la materia y solo trataremos con números reales o naturales aquí, es interesante remarcar que _si cambiamos  el dominio, aunque mantengamos la fórmula son funciones distintas con distintas propiedades_. O sea:

-  $f(x) = x^2$ con $f: \mathbb{R} \rightarrow \mathbb{R}$ es una función no sobreyectiva en $R$ porque no genera números negativos.
-  $f(x) = x^2$ con $f: \mathbb{C} \rightarrow \mathbb{C}$ es una función sobreyectiva que no solo genera todos los positivos y los negativos, sino cualquier número complejo.

Esta idea de que generar funciones distintas con dominios distintos será importante en una sección siguiente, donde nos aventuraremos a invertir lo no invertible.
"

# ╔═╡ d60908fe-5395-11eb-1967-75fb46b2382e
md"
### Biyectivas

A esta altura del apunte ya sabemos todo sobre lo que necesitamos para que una función sea invertible:

- Que sea inyectiva (no repetir valores) para que la inversa sea única.
- Que sea sobreyectiva (cubrir todo el codominio con la imagen) para que la inversa exista.

Llamaremos **biyectivas** a las funciones que sean simultáneamente inyectivas y sobreyectivas. Como se deduce de todo lo anterior, cualquier función biyectiva es invertible.
"

# ╔═╡ 052c61b4-5396-11eb-03f1-5f00cb65497c
md"### Invirtiendo lo no-invertible

Hasta ahora entendimos que **necesitamos** que una función sea biyectiva para que poder invertirla. Pero... ¿Y si tenemos una función inyectiva y **necesitamos** invertirla?

En la vida real nos podemos encontrar con ese problema. Supongamos que a nuestra consultora de logística la contrata un balneario en construcción que necesita tomar una decisión: quiere ver a qué hora deberá levantar las carpas para que no se inunden al subir la marea y en función de eso saber cuándo hacer las ofertas de su confitería para mantener a la gente cautiva.

Como estudiamos ingeniería, tomaremos mediciones por unos días y luego modelaremos la marea con algo similar a una función trigonométrica, ya que la marea es una función periódica: aumenta a la noche, y disminuye durante el día.
"

# ╔═╡ 645aa8d0-5396-11eb-198c-eb0b414fb61b
# gráfico que se aproxima por un coseno

# ╔═╡ d25e50a8-5395-11eb-0ad7-0faeadafb95a
md"
Una vez que terminamos con este trabajo, tendremos una función del aspecto $h(t) = 10 \text{m } cos(\frac{2\pi}{24\text{h}} t)$. Es decir, aproximamos la marea con una función de amplitud de $10$ metros entre la máxima y la mínima marea, donde la frecuencia es de $24$ horas.

Como hemos medido todo lo que hay que medir, sabemos que las carpas se inundarán aproximadamente cuando la marea suba $5$ metros. Sencillo, ¿no? Tenemos que calcular un $t_0$ para el cual $h(t_0) = 5 \text{m}$. nos vendría muy bien tener una inversa $h^{-1}(y)$ que dada una altura nos devuelva el tiempo en el cual se llega a esa altura.

Como hemos prestado atención y de nuevo, somos profesionales con prudentes, primero verificaremos que _podemos_ invertir esa función.

Momento... ¡El coseno no tiene inversa! ¡El proyecto entero se ha echado a perder! No entremos en pánico. Todavía tenemos más herramientas que poner sobre la mesa.

Conceptualmente, ¿cuál es el problema? La pregunta que habíamos hecho era perfectamente válida. Volvamos a ver el gráfico:
"

# ╔═╡ 6f780852-5396-11eb-2425-2b51da1ad3d0
# gráfico con los días separados por colores, con los 6 metros marcados

# ╔═╡ 79103d28-5396-11eb-2534-b96a12cfb50f
md"
Claro. El problema es evidente. Se llega a los 6 metros dos veces por día todos los días. Si nosotros queremos una función inversa que dada una altura nos devuelva el tiempo, esta \"función\" no sabrá si darnos el día de hoy, el de mañana, el siguiente... Vamos a concentrarnos en un solo día.
"

# ╔═╡ 80e5b742-5396-11eb-3287-456ce5221efe
# gráfico del coseno en 24 horas

# ╔═╡ 8749a80a-5396-11eb-1757-5dcc4a259298
md"
Ahora estamos mucho mejor, aunque se sigue dando el mismo problema: dos veces al día la marea llega a casi todas las alturas. De hecho, mirándola de cerca, esta función se parece bastante a una cuadrática. Nos centraremos entonces en la marea entre la medianoche y el mediodía.
"

# ╔═╡ 8bac75d0-5396-11eb-2a3f-a9d221ab9c1b
# gráfico entre las 12am y 12pm

# ╔═╡ 99eb6e3a-5396-11eb-1654-37ffd9d2869b
md"

¡Bien! Esto ya tiene mucho mejor aspecto. Ya no repetimos valores. La función que estamos viendo es una nueva. Tiene la misma fórmula que antes, pero está definida en otro dominio. Antes estábamos tomando $h: \mathbb{R} \rightarrow \mathbb{R}$ y ahora $h: [0,12] \rightarrow \mathbb{R}$. La anterior no era inyectiva, esta sí.

Sin embargo sabemos que la función también tiene que ser sobreyectiva para poder invertirla, y esto tampoco se estaría cumpliendo. Bueno, he aquí el truco: así como restringimos nuestro dominio, podemos restringir nuestro codominio. Si decimos que nuestra $h$ ahora va de $[0,12] \rightarrow [10, -10]$, ¡ahora nuestra imagen cubre todo nuestro dominio! 

Esto último parece un abuso de la matemática, porque no cambiamos nada de la fórmula, solo achicamos el espacio de origen y el de destino. Pero en verdad, en la ingeniería esto es importante: restringir el problema a algo pequeño lo hace más fácil de resolver.

Es importante ver además que al invertir, tendremos una función $h^{-1}: [10, -10] \rightarrow [0,12]$. Es decir, se invierten dominio y codominio. Gracias a que restringimos el codominio en $h$ ahora podemos pedirle a $h^{-1}$ valores en todo su dominio con tranquilidad. Si no lo hubiéramos hecho, nosotros le podríamos pedir $h(20)$ y esta inversa se vería obligada a algo que no puede hacer: decirnos en qué momento la marea llega a 20 metros, lo cual nunca ocurre.

Volvamos a las cuentas:

$$h(t) = y = 10 \text{m } \cos(\frac{2\pi}{24\text{h}} t)$$

$$\frac{y}{10\text{m}} = \cos(\frac{2\pi}{24\text{h}} t)$$

$$\frac{24h}{2\pi}\arccos \frac{y}{10 \text{m}} = t = h^{-1}(y)$$

Algunas observaciones:

- Las unidades son correctas. Adentro del arcocoseno se divide y (en metros) por $10$m, lo cual es adimencional, y luego se multiplica por horas afuera.
- Usamos la función arcocoseno, que es la inversa del coseno. Esta función solo la podemos usar porque restringimos el dominio, ya que es una función que solo arroja resultados de $-\pi$ a $\pi$.

Finalmente, aplicamos nuestra función inversa $h^{-1}(6\text{m}) = NN$ y obtuvimos la hora a la que la marea pasa por allí al amanecer. Averiguamos lo mismo para el atardecer mirando el gráfico
"

# ╔═╡ 9e60ba7e-5396-11eb-26ca-638c7c62eae7
# repetimos el gráfico de un solo día, con un color hasta las 12 y otro después

# ╔═╡ a9b5c5ea-5396-11eb-30a0-b70a5b821499
md"

Vemos que esto es simétrico en el mediodía, así que hacemos $24 - NN$ y esto nos da $XX$ que es nuestra solución.

El balneario quedó muy contento, y satisfactoriamente pudo mantener su confitería de comida marina funcionando al máximo utilizando estos cálculos que hicimos luego de medir.
"

# ╔═╡ b08703fc-5396-11eb-115e-397c0612ef95
md"
#### Generalizando

Del ejemplo que acabamos de leer nos llevamos que:

- Para \"inyectivizar\" una función no inyectiva tenemos que restringir el _dominio_ hasta que no haya valores repetidos.
- Para \"sobreyectivizar\" una función no sobreyectiva tenemos que restringir el _codominio_ hasta que coincida con la imagen.

En particular, deberemos quedarnos con el dominio que querramos para la solución que buscamos, con un poco de información extra del problema. En el ejemplo anterior elegimos el primer mediodía por conveniencia, pero podría variar según el ejercicio. Por ejemplo, si quisiéramos invertir $f(x) = x^2$ tendremos que quedarnos con una mitad del gráfico:
"

# ╔═╡ be2f435c-5396-11eb-1d26-235f5b97e4e5
# Gráfico de x^2

# ╔═╡ c6dfa3d6-5396-11eb-318d-85da105b63ca
md"

Si queremos una solución positiva tendremos que quedarnos con los x positivos. Si queremos una solución negativa, con los negativos. Esto es fácil de calcular:

$$y = f(x) = x^2$$

$$\sqrt{y} = |x|$$

o sea, tenemos dos opciones de inversa, según cómo acotemos el dominio:

-  $f^{-1}(y) = \sqrt{y}$ si $x \ge 0$. O sea, la inversa de $f: \mathbb{R}^+_0 \rightarrow \mathbb{R}$
-  $f^{-1}(y) = -\sqrt{y}$ si $x \le 0$. O sea, la inversa de $f: \mathbb{R}^-_0 \rightarrow \mathbb{R}$

Graficando:
"

# ╔═╡ d9e31ca4-5396-11eb-09f0-17eef4097cf1
# Gráfico de ambas ramas con los colores.

# ╔═╡ d718bf24-5396-11eb-2a80-afbeb54cc8d8
md"

Esto nos da un dato más: el gráfico no se \"rota\" así nomás. Se dan vuelta las abscisas y las ordenadas. Esto se ve bien en los colores.

### Trailer y yapa

En el ejercicio del balneario sacamos la función $\arccos$ de la galera, lo cual si bien es perfectamente válido, podría dejar la sensación de \"¿pero.. cómo se calcula esa función?\". Cantando retruco, podríamos preguntarnos \"pero momento, ¿y cómo se calcula el coseno normalmente? ¿Y una raiz cuadrada?\".

Nosotros sabemos multiplicar, dividir, sumar... Pero todas estas otras funciones si solo tuviéramos un papel, hoy por hoy, no podríamos resolverlas. Normalmente se las pedimos a una calculadora, o a Julia, que es algo así como una calculadora con generaciones de evolución. Antes de eso se usaban tablas de valores y se aproximaban los que estuvieran cerca.

Y una calculadora, o Julia, ¿cómo hacen para calcular una raiz cuadrada o un coseno?

Bueno, existen técnicas que se llaman \"métodos numéricos\" para esto, que se basan en partir de un resultado cercano e ir aproximando.

Hace un rato mencionamos, por ejemplo, que el coseno se parece a una función cuadrática, sobre todo si nos vamos acercando al máximo:
"

# ╔═╡ f5a10512-5396-11eb-004a-f1d8a701208d
# gráfico con el zoom variable

# ╔═╡ f1927246-5396-11eb-26e5-574a49aca33c
md"
Esta idea de aproximar con funciones más simples también se aplica a las lineales.
"

# ╔═╡ cdc72d66-5396-11eb-3449-4bda0462e0af
# gráfico de un seno y una lineal

# ╔═╡ Cell order:
# ╟─57c122b6-5394-11eb-3970-75f46fb55ac4
# ╠═91290ffc-5394-11eb-27a0-179e75f62ae7
# ╟─906f8a00-5394-11eb-07f3-7f9633d5b1bb
# ╟─a3e63a02-5394-11eb-1998-ddf95c42b883
# ╠═af0a24f2-5394-11eb-3088-ef7f8d39976d
# ╟─c17c27b6-5394-11eb-2cfe-0f20790ba851
# ╠═c5e02adc-5394-11eb-1f62-d5a900d8277f
# ╟─cce85ae8-5394-11eb-208e-f3cb40ff5b6b
# ╠═cffc9744-5394-11eb-29b8-29d1e2595731
# ╟─d824731a-5394-11eb-3118-bf5202cb32b5
# ╟─e2295fec-5394-11eb-39ed-adb18e08b0a3
# ╟─efde60c4-5394-11eb-159b-d1667ea62c3c
# ╠═05bc6ea4-5395-11eb-2f8c-e5430def4de7
# ╟─188135a6-5395-11eb-3d2e-274357cbcb24
# ╟─1e75c7c4-5395-11eb-3f7f-21c8dc5d8982
# ╟─291aa2d0-5395-11eb-0938-b355089f8303
# ╠═3675ca40-5395-11eb-0fa4-958a41909abe
# ╟─3e567aca-5395-11eb-13c2-4722d715ef17
# ╠═47a461a0-5395-11eb-13f1-e31932db7f69
# ╟─4f7f9412-5395-11eb-125e-b944e3e51439
# ╟─59214df8-5395-11eb-08f7-01bffd778585
# ╠═78346d60-5395-11eb-356b-7b6079466bfb
# ╟─54bb5bb4-5395-11eb-065c-b5f101121fd8
# ╟─901fdfae-5395-11eb-239d-21578a4d1c52
# ╟─a408db22-5395-11eb-2ec8-ad8ffa782e5e
# ╠═b54b0dee-5395-11eb-2386-b1bd3d67bd4e
# ╟─87fd0e96-5395-11eb-1272-a380b4042949
# ╟─c549304a-5395-11eb-06ee-23f468475a76
# ╟─d60908fe-5395-11eb-1967-75fb46b2382e
# ╟─052c61b4-5396-11eb-03f1-5f00cb65497c
# ╠═645aa8d0-5396-11eb-198c-eb0b414fb61b
# ╟─d25e50a8-5395-11eb-0ad7-0faeadafb95a
# ╠═6f780852-5396-11eb-2425-2b51da1ad3d0
# ╟─79103d28-5396-11eb-2534-b96a12cfb50f
# ╠═80e5b742-5396-11eb-3287-456ce5221efe
# ╟─8749a80a-5396-11eb-1757-5dcc4a259298
# ╠═8bac75d0-5396-11eb-2a3f-a9d221ab9c1b
# ╟─99eb6e3a-5396-11eb-1654-37ffd9d2869b
# ╠═9e60ba7e-5396-11eb-26ca-638c7c62eae7
# ╟─a9b5c5ea-5396-11eb-30a0-b70a5b821499
# ╟─b08703fc-5396-11eb-115e-397c0612ef95
# ╠═be2f435c-5396-11eb-1d26-235f5b97e4e5
# ╟─c6dfa3d6-5396-11eb-318d-85da105b63ca
# ╠═d9e31ca4-5396-11eb-09f0-17eef4097cf1
# ╟─d718bf24-5396-11eb-2a80-afbeb54cc8d8
# ╠═f5a10512-5396-11eb-004a-f1d8a701208d
# ╟─f1927246-5396-11eb-26e5-574a49aca33c
# ╠═cdc72d66-5396-11eb-3449-4bda0462e0af
