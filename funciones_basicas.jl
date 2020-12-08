### A Pluto.jl notebook ###
# v0.12.4

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ a3658046-3725-11eb-1bb6-e981ac1de371
using Plots

# ╔═╡ 80448600-3763-11eb-0426-071d4c5c2581
using PlutoUI

# ╔═╡ b5ea471a-3725-11eb-09de-eb08414cea0c
plotly()

# ╔═╡ a88df786-376d-11eb-30bf-d36644f2462d
md" ## Bienvenides al maravilloso mundo de Análisis Matemático I "

# ╔═╡ 6783a4fc-376d-11eb-32c9-c16376782b06
snake_math = "https://i.imgur.com/nsrOoqp.png"



# ╔═╡ 920d6d1e-376d-11eb-169d-b7ba0fc2f787
Resource(snake_math)

# ╔═╡ b02439b8-3756-11eb-08fc-a1ab31ae4b9e
md"""
### Funcion lineal 

Cuando decimos que una funcion es $y$ es una funcion lineal de $x$, queremos decir que el grafico de esta es una linea recta, por lo que podemos utilizar la forma `pendiente  (m)` - `ordenada(b)` al origen para describir la funcion:
$y = f(x) = m \cdot x + b$

Una de las caracteristicas de las funcione slineales es que cambian a una tasa constante. Por ejemplo en la siguiente figura se observa el grafico de una funcion lineal `f(x) = 3 x -2` , se puede ver que a medida que `x` aumenta en `0,1` , el valor de `y` lo hace en `0,3` , entonces `f(x)` aumenta su valor tres veces mas rapido que `x`. Esto significa que la pendiente de la recta puede ser visto como la tasa de crecimiento dA characteristic feature of linear functions is that they change at a constant ratee `y` respecto a `x`
"""

# ╔═╡ afcf8e22-3756-11eb-34ea-5376536fb482
begin
f1(x) = 3x - 2
plot(f1, -0.1, 2,m=:circle)
xlims!(0,2)
ylims!(-1.1,1.1)
end

# ╔═╡ 0bbab030-37e9-11eb-2d59-750dcc1389ed
md" ### Buenos Aires - Mar del Plata"

# ╔═╡ 669fff32-37e9-11eb-0a8f-b9965e7fc876
md"
Veamos un ejemplo. Buenos Aires está aproximadamente a 400 kilómetros de Mar del Plata. Si vamos a 100km/h llegaremos en 4 horas, mientras que si vamos a 50km/h llegaremos en 8. ¿Cómo podemos escribir esta relación?

Si llamamos v a la velocidad y t el tiempo que llevamos de viaje, podemos ver que el camino recorrido será: \\[ v \cdot t = (100 \frac{km}{h} \cdot 4 h) = 400 km \\]

Vamos a graficar el recorrido para los dos ejemplos de los que charlamos
"


# ╔═╡ 668188c0-37e9-11eb-2b79-21a9ad8c8045
begin 
x1 = collect(0:0.1:12) 
plot(x1,x1.*100,lab="100km/h") 
plot!(x1,x1.*50,lab="50km/h") 

ylims!(0,500)
end

# ╔═╡ a54b80a2-37ef-11eb-1561-ff2eb53d96ff
md"Podemos ver que:

- El recorrido se ve como una recta, porque la velocidad es constante: no importa en qué momento $t_0$ del recorrido me pare, sé que en $t_0 + \Delta t$ habré recorrido $v \cdot \Delta t.$

- La velocidad determina qué tan “empinada” es la recta. Por eso, esta constante de la ecuación se llama “pendiente” y es la que relaciona la posición con el tiempo.

En el ejemplo anterior teníamos dos ecuaciones, una por cada recorrido:

$x_{auto \ rapido} = v_1 \cdot t = 100 \frac{km}{h} \cdot t$
$x_{auto \ lento} = v_2 \cdot t = 50 \frac{km}{h} \cdot t$



En el siguiente gráfico podemos observar que si cambiamos la velocidad, la pendiente de la recta cambia"


# ╔═╡ b9f68ee2-37f0-11eb-32b9-f5f8414a003f
begin
	vslider=  @bind v Slider(0:50:200; default=10, show_value=true)
	md""" Velocidad: v $(vslider)"""

end

# ╔═╡ a59a24ae-37f0-11eb-27a7-4168be79ae76
begin 
x2 = collect(0:0.1:13) 
plot(x2,x2.*v,lab="$v km/h") 
xlabel!("Tiempo [h]")
ylabel!("Distancia [km]")
ylims!(0,500)
xlims!(0,12)
end

# ╔═╡ 1c5b9714-37f2-11eb-2aee-c12c5b3378b6
md"
Dada la velocidad de un auto… podemos predecir cuándo llega a Mar del Plata? Podemos!

$$x(t) = v \cdot t$$
$$\text{Distancia a MDQ} = v \cdot \text{Tiempo de viaje}$$
$$400 km = v \cdot \text{Tiempo de viaje}$$
$$\text{Tiempo de viaje} = v / 400km$$
"

# ╔═╡ 1bb527c8-37f2-11eb-392d-91cd73e93975
md"
##### Saliendo desde Chascomús"

# ╔═╡ fc574524-37f5-11eb-332f-e9240245e01c
md"
Saliendo desde Chascomús (kilómetro 120)
Pero esto es poco realista. No todos los autos salen de la capital. Comparemos con un Auto que sale de Chascomús, que está a 120 km de Buenos Aires.

¿Cómo cambia la ecuación si agregamos una posición inicial?

$$x(t) = v \cdot t + x_0$$

$$x_0: \text{Posición inicial} (\text{Chascomus})$$ 
Observemos que la posición inicial es una constante, al igual que la velocidad, para un recorrido determinado. Si yo elijo la posición y la velocidad, eso me determina todo el recorrido de la posición del auto en función del tiempo.

Grafiquemos cómo llega un auto que sale de buenos aires vs un auto que sale de Chascomús ambos a $400 \frac{km}{h}$, saliendo en $t=0$.
"

# ╔═╡ 01f8039c-37f6-11eb-3cf1-0fb81e04cd85
begin 
x3 = collect(0:0.1:12) 
plot(x3,x3.*100,lab="Salgo CABA",legend=:bottomright) 
plot!(x3,x3.*100 .+120,lab="Salgo Chascomús")
plot!([500], seriestype="hline", lab="Mar del Plata", linestyle=:dot)
plot!([120], seriestype="hline", lab="Chascomús", linestyle=:dot)
xlims!(0,6)
ylims!(0,600)
end

# ╔═╡ 01d9c8c8-37f6-11eb-2d49-f7767d7422d1
md"Refleccionemos un poco sobre este gráfico. ¿Cómo se relacionan entre sí ambas rectas?

- Ambas rectas tienen la misma pendiente, porque tienen la misma velocidad.
- Una está “más arriba” que la otra. ¿Qué tanto más arriba? Recordemos que el eje vertical es la posición. Si lo pensamos, el auto que sale de Buenos Aires sale del $km=0$, mientras que el otro sale del $km=120$. Esto significa que una recta estará exactamente $120km$ arriba de la otra.
Esto último lo podemos ver justamente en las ecuaciones:

$x_{auto\ desde \ BsAs}(t) = 100 \frac{km}{h} \cdot t$
$x_{auto\ desde \ Chascomus}(t) = 100 \frac{km}{h} \cdot t + 120 km$

O sea:

$x_{auto\ desde \ BsAs}(t)  + 120km = x_{auto\ desde \ Chascomus}(t)$

¡Esto es interesante! Esta última ecuación nos dice que independientemente de cómo esté hecha una función, podemos armar otra sumándole un número y que eso nos dará otra función, pero más arriba en el gráfico. 

Vamos a generalizar esto. En el siguiente gráfico incluimos un slider para empezar desde distintos lugares. Pueden moverlo para ver cómo sería salir desde más cerca o más lejos de la capital.
"


# ╔═╡ e340bc70-380e-11eb-2ea0-7d318e0b3b4f
begin
	xinicslider=  @bind xinic Slider(0:10:200; default=120, show_value=true)
	md""" Salgo :  $(xinicslider) kilometros más adelante"""

end

# ╔═╡ e9b6d660-380d-11eb-168f-15b5a4da6e25
begin 
x4 = collect(0:0.1:8) 
plot(x4,x4.*100,lab="Salgo CABA", legend=:bottomright) 
plot!(x4,x4.*100 .+xinic,lab="Salgo $xinic Km más adelante") 
plot!([500], seriestype="hline", lab="Mar del Plata", linestyle=:dot)
plot!([120], seriestype="hline", lab="Chascomús", linestyle=:dot)
xlims!(0,6)
ylims!(0,600)
end

# ╔═╡ 9f37e412-3817-11eb-3013-edf105cc933a
md"

Aquí confirmamos esto que decíamos antes. 

¿Y si quisiéramos ahora predecir en qué tiempo voy a llegar a Mar del Plata? Ahora también tenemos que tener en cuenta la posición inicial… Vamos a hacer el mismo procedimiento que antes: escribimos la ecuación de posición en función del tiempo y luego despejamos el tiempo para la posición que queremos.

$x_{auto}(t) = v \cdot t + x_0$

Reemplazamos con nuestros datos y despejamos:

$\text{Distancia a MDQ} = v \cdot \text{Tiempo hasta MDQ} + \text{Distancia hasta Chascomús}$

$\frac{\text{Distancia a MDQ} - \text{Distancia hasta Chascomus}}{v} = \text{Tiempo hasta MDQ}$

Acá lo que vimos es que el tiempo que nos tardó en llegar de Chascomús a Mar del Plata es la distancia recorrida (la resta de la izquierda, $x_{final} - x_0$) sobre la velocidad. En el ejemplo de Buenos Aires, la posición inicial era siempre $0$, entonces esta resta quedaba directamente la $x_{final}$.
"

# ╔═╡ 6310dea6-3819-11eb-1466-977f16bc1521
md" #### Saliendo mas tarde "


# ╔═╡ 6fc7d4ba-3819-11eb-3c75-43f0a52000da
md" Pero ahora estamos saliendo en $t=0$. Las 12 de la noche podría ser un horario incómodo. Imaginemos que queremos salir a las 6 am para llegar a las 10 am, o sea saldremos en $t = 6$… ¿Cómo podemos expresar esto en nuestras ecuaciones?

Antes cuando salíamos desde Chascomús, teníamos que la recta se desplazaba verticalmente en esa diferencia de distancia, ya que el eje vertical era la posición. Ahora lo que nos gustaría que la recta se “mueva” en el eje horizontal, que es el tiempo, para expresar que salimos más tarde.

El truquito en este caso es que antes sumábamos “afuera” la posición inicial, ya que sumábamos posición con posición. Si ahora que queremos sumar 6 horas al tiempo tenemos que hacerlo al tiempo directamente. Antintuitivamente, para que la recta se desplace a la derecha, tenemos que restar en lugar de sumar. En un ratito veremos por qué.

$x_{saliendo\ 6am}(t) = x_{saliendo\ 12am}(t-6h)$
$x_{saliendo\ 6am}(t) = 100 \frac{km}{h} \cdot (t - 6h)$
$x_{saliendo\ 6am}(t) = 100 \frac{km}{h} \cdot t - 600km$

Vamos a graficarlo.
"

# ╔═╡ 8766aeb8-3819-11eb-0842-2169cb334dff
begin 
x5 = collect(0:0.1:20) 
plot(x5,x5.*100,lab="Salgo a las 12 am", legend=:bottomright) 
plot!(x5,x5.*100 .-600,lab="Salgo a las 6am") 
plot!([500], seriestype="hline", lab="Mar del Plata", linestyle=:dot)
plot!([120], seriestype="hline", lab="Chascomús", linestyle=:dot)
xlims!(0,12)
ylims!(0,600)
end

# ╔═╡ 38b55daa-381a-11eb-23e6-e1fca6acd232
md" 

Lo interesante es que Efectivamente nuestra recta está \"más a la derecha\".

Fijémosnos que la ecuación nos dio igual que la de antes, pero como si hubéramos empezado en $-600km$!! Esto si bien no es lo que escribimos, es equivalente. Es decir, salir $6$ horas más tarde es lo mismo que salir $600 km$ más lejos. Por ejemplo, esto saría salir desde Rio Cuarto (Córdoba), viajar hasta Buenos Aires y luego hasta Mar del Plata.

Es más, pongamos a prueba esto último. Extendamos la recta del auto que sale a las 6am hasta las 12am. ¿A dónde habría estado el auto?

"

# ╔═╡ f98ab398-38c8-11eb-23e0-e7d53a94191f
begin 
x6 = collect(0:0.1:20) 
plot(x6,x6.*100,lab="Salgo a las 12 am", legend=:bottomright) 
plot!(x6,x6.*100 .-600,lab="Salgo a las 6am") 
plot!([500], seriestype="hline", lab="Mar del Plata", linestyle=:dot)
plot!([0], seriestype="hline", lab="Capital Federal", linestyle=:dot)
plot!([-600], seriestype="hline", lab="Rio Cuarto (-600km)", linestyle=:dot)
xlims!(0,12)
ylims!(-650,600)
end

# ╔═╡ 333bde28-38c9-11eb-1c13-43497cd11386
md"
Comprobamos entonces lo que sospechábamos: si salimos a las 6 am desde capital, es lo mismo que salir a las 12am, $600km$ más atrás, desde Rio Cuarto, si vamos a $100\frac{km}{h}$.
"

# ╔═╡ d7194f12-381a-11eb-3cca-fbd7dc8882ad
md"
###### Generalizando 

Dejando de pensar un segundo en velocidades y posiciones, las funciones lineales pueden pensarse con la ecuación 

$y = f(x) = m x + b$

donde:

-  $x$ es la variable “de entrada”.
-  $y$ “la de salida”
-  $m$ es la pendiente.
-  $b$ es el valor inicial.

En nuestro ejemplo teníamos:

-  $x$ era el tiempo $t$.
-  $y$ era la posición en función del tiempo, $x(t)$.
-  $m$ era la velocidad $v$.
-  $b$ era la posición inicial $x_0$.


Luego vimos cómo calcular la entrada $x$ conociendo una salida $y$ (\"cuánto tiempo tardamos en llegar a mar del plata\"). A esto lo llamamos la _inversa_ de la función. Para funciones lineales, calcular la inversa es tan sencillo como “despejar” $x$. Más adelante, cuando veamos otras funciones, el cálculo se hará más complicado.

$y(x) = m \cdot x + b$
$x(y) = \frac{(y - b)}{m} = \frac{y}{m} - \frac{b}{m}$

Algo a remarcar, es que la función inversa de una lineal es otra lineal donde $y$ es la variable de entrada. Si lo presentamos como $x(y) = m’y + b’$... ¿Cuáles son nuestras nuevas pendientes y valores iniciales? Basta ver la ecuación anterior:

$m’ = \frac{1}{m}$

$b’ = -\frac{b}{m}$

Esto tiene sentido. Cuanto mayor haya sido la pendiente, menor será la de la inversa. Si nuestra velocidad a Mar del Plata era muy alta, el tiempo que nos tardará recorrer una distancia será más chico.

"

# ╔═╡ d691d366-381a-11eb-2204-6363ae55ff34
md"
Hagamos un ejemplo. Tenemos la función lineal $y(x) = mx - 5$. Si despejamos $x$ llegamos a $x(y) = \frac{y}{m} + \frac{5}{m}$. Grafiquemos estas funciones y variemos la pendiente m.
"

# ╔═╡ 85c0c7cc-38fa-11eb-0f1f-654ee2eb8909
begin
	m_slider=  @bind m1 Slider(-3:0.1:3; default=3, show_value=true)
	md"""Pendiente de la función lineal: $(m_slider)"""
end

# ╔═╡ 9420c8d4-38f8-11eb-2204-77a06514b0c0
begin
	x7 = collect(0:5)
	b2 = 1
	binv = b2/m1
	p1 = plot(x7, x -> m1*x - b2, label="", colour=:red)
	xlabel!("x")
	ylabel!("y")
	title!("$m1 x - $b2")

	p2 = plot(x7, x -> x/m1 + binv, label="", colour=:blue)
	xlabel!("y")
	ylabel!("x")
	title!("y/$m1 + $(round(binv, digits=2))")

	plot(p1, p2, layout=(1,2))
	ylims!(-10,10)
end

# ╔═╡ 5fdedfea-38fe-11eb-154b-b1571a457c74
md"
Podemos ver que en los valores de m más altos el gráfico de la inversa tiene una pendiente pequeña, mientras que en los valores más cercanos al 0, la inversa tiene una pendiente alta y además su desplazamiento se hace mayor.
"

# ╔═╡ af631940-3756-11eb-0744-59341550b719
md"### Ejemplo 2

A medida que aire seco sube, se expande y enfria. Si la temperatura en el nivel del suelo es de `20°C` y la temperatura a 1km es de `10°C`, ¿Cúal será la temperatura (en °C) en funcion de la altura `h` (en kilometros)? 
asumir que un modelo lineal es apropiado

------

Como asumimos un modelo linal podemos asumir que la temperatura viene dada por la ecuacion `T(h) = mh + b` . Como sabemos que la temperatura al nivel del suelo es de 20°C podemos escribir `20= m . 0 + b`, de donde obtenemos que b = 20, es decir que 20 es la ordenada al origen.
Además sabemos que a 1km la temperatura es de 10°C , que en terminos de la ecuacion implica 10 = m . 1 + 20, por lo que la pendiente resulta `m = 10 -20 = -1`
Finalmente podemos escribir que `T=-10h +20` es laa funcion que describe la temperatura del aire en funcion de la altura

Graficando tenemos
"

# ╔═╡ eaf5a3d2-37e8-11eb-3884-d7bef46081b1


# ╔═╡ ea967346-37e8-11eb-3708-f7f5c68e008c


# ╔═╡ afb7ef92-3756-11eb-0db6-6f726d587a4e
md" Veamos que pasa si cambiamos la pendiente y la ordenada al origen"


# ╔═╡ af9a0036-3756-11eb-1581-f7f90b2744a4
begin
	mslider=  @bind m Slider(-100:100; default=10, show_value=true)
	bslider = @bind b Slider(-10:10; default=0, show_value=true)
	md"""Pendiente: m $(mslider)
	
	Termino independiente: b $(bslider)"""
end

# ╔═╡ e915fed6-37e8-11eb-33b1-bfeeb67d9efc


# ╔═╡ af7c90d2-3756-11eb-1e04-d7f1dbd0fa45
begin
f2(x) =m*x+b
plot(f2,color=:blue,m=:blue)
xlims!(-3,3)
ylims!(-10,10)
end

# ╔═╡ af2d39ec-3756-11eb-29ba-73c6a59df0c9
md" ## Rectas  paralelas y  ortogonales 
supongamos que tenemos una recta de la forma , 
`y= f(x) = m x + b`

Veamos que pasa si tenemos las funciones: 
`y1= 2 x + -2` ; `y2= 4 x + -2` ; `y3= -1/2 x + -2`


"
#No se que pasa que no se ven perpendiculares

# ╔═╡ af1139ae-3756-11eb-1013-9738a6a3e83d
begin
x0 = collect(-10:0.1:10)
	
plot(x0, x0.*2 .-2) 
plot!(x0, x0.*2 .+2)
plot!(x0, x0.*(-1/2))
xlims!(-2.5,2.5)
ylims!(-2.5,2.5)

end

# ╔═╡ aef666ce-3756-11eb-0c74-554cb9d31bae
md"""
### Traslaciones de la funcion 

Supongamos que tenemos las constantes A, b y c  . Veremos como se puede modificar la funcion f(x)=x

- `y = A f(x+b) + c` 

"""

# ╔═╡ aedb7472-3756-11eb-1b58-0fc5a700fee0
begin
	Aslider = @bind  A Slider(-10:10; default=0, show_value=true)
	b1slider = @bind  b1 Slider(-10:10; default=0, show_value=true)
	cslider = @bind  c Slider(-10:10; default=0, show_value=true)
	md"""A:  $(Aslider)
	
	b:  $(b1slider)
	
	c:  $(cslider)
	"""
	
end

# ╔═╡ aebe3266-3756-11eb-32a4-17ff01f60908
begin
plot(x0,((((x0).+b1))*A).+c,label="f(x)")
xlims!(-10,10)
ylims!(-10,10)
end

# ╔═╡ efbac940-3768-11eb-31ed-55e1dc275376
md" ### Funcion cuadrática"

# ╔═╡ aea292ce-3756-11eb-1dfd-1fd920be6ecf
md" #### Un ejemplo de funcion cuatratica 

Se lanza una pelota desde arriba de una torre muy alta la cual se encuentra a `450m` de altura y la altura de la misma `h` es sensada en intervalos de `1 segundo` . Como se sultado observan los datos representados en la siguiente tabla

| Tiempo | Metros |
|--------|--------|
| 0      | 450    |
| 1      | 445    |
| 2      | 431    |
| 3      | 408    |
| 4      | 375    |
| 5      | 332    |
| 6      | 279    |
| 7      | 216    |
| 8      | 143    |
| 9      | 61     |

Vamos a tratar de encontrar el mejor modelo para tratar de precedir el tiempo en el cual la pelota tocara el suelo"

# ╔═╡ ae87bde6-3756-11eb-121a-211c9e728dae
md" 
Primero vamos a graficar los puntos obtenidos"

# ╔═╡ ae6c0470-3756-11eb-3293-37e5e5b7c425
begin
	t=collect(0:1:9)
	h0=[450,445,431,408,375,332,279,216,143,61]
	scatter(t,h0,label="Altura")
	plot!(t,h0,label="curva interpolada")

end

# ╔═╡ ae51af80-3756-11eb-082d-89b9a6c434e1
md"
Se puede inferir que tiene forma de media parabola. Utilizando la técnica de [`cuadrados minimos`](https://es.wikipedia.org/wiki/M%C3%ADnimos_cuadrados) (no te preocupes esto lo vas a ver más adelante, por ahora solo nos interesa lo que nos devuelve) podemos obtener la siguiente forma cuadratica del modelo 
`h = 449,36 + 0.96 t -4.90t²`
Si queremos encontrar cuando la pelota toca el piso debemos imponer que `h=0=-4.90t²+0.96t+449,39`. Utizando la formula cuadratica $-b \pm \sqrt{b^2 - 4ac} \over 2a$ vamos a obtener que el tiempo aproximado, es decir la raiz es `t~9.96`
"

# ╔═╡ 7e68db0c-381b-11eb-3028-ef015cf632bf


# ╔═╡ 7e4bdd54-381b-11eb-32f8-d36c3b9c15a5


# ╔═╡ 7e30db44-381b-11eb-3e86-3bf955568345


# ╔═╡ 22f7bc0e-376a-11eb-39c6-9980c3c50e22
md" 
### Funciones trigonometrica
"

# ╔═╡ d6d1a830-37f5-11eb-229f-65f8c08a8f62
begin
	aslider = @bind a Slider(-10:0.5:10; default=1, show_value=true)
	zslider = @bind z Slider(-10:10; default=1, show_value=true)
	Φslider = @bind Φ Slider(-5:10; default=0 , show_value=true)
	md"""θ0 Amplitud : $(aslider)

	Periodo: T $(zslider)
	
	Desfasaje: Φ $(Φslider) """

end

# ╔═╡ d6b126fa-37f5-11eb-3d79-4913a173eb30
begin
	
w=collect(-2π:0.01:2π)
tr1 = plot(w, cos.(((2π/z)*w) .+Φ).*a,label="Coseno", colour=:red)
tr2 = plot(w, sin.(((2π/z)*w ).+Φ).*a,label="Seno", colour=:blue)
	
plot(tr1,tr2 , label=["" "" ], title=["coseno(x)" "seno(x)"],layout=(2,1)) 	
ylims!(-3,3)

end

# ╔═╡ d6812770-37f5-11eb-36ad-b1ae4acb4338


# ╔═╡ d65ee4ee-37f5-11eb-2c9d-4b309b276bd8
md" #### Funciones logaritmicas
"

# ╔═╡ d639c952-37f5-11eb-08d9-a53068c806c6
begin
u=collect(0.01:0.01:10)
plot(u,log.(10,u),label="log 10 x")
plot!(u,log.(3,u),label="log 3 x")
plot!(u,log.(5,u),label="log 5 x")
plot!(u,log.(2,u),label="log 2 x")
xlims!(0,5)
ylims!(-8,3.1)

end

# ╔═╡ d61e2bf2-37f5-11eb-0239-3380f1ed1093
md" ### El numero *e* "

# ╔═╡ d60134c0-37f5-11eb-1306-799eef7788fe
begin
f10(x10)= 2^x10 
x10 = collect(-2:0.1:2)
y10=f10.(x10)
g(x10)= exp(x10) 
y11=g.(x10)
h(x10)=3^x10
y12=h.(x10)
i(x10)=exp(-x10)	
y13=i.(x10)
plot(x10,y10,lab="2^x")
plot!(x10,y11,lab="exp(x)")
plot!(x10,y12,lab="3^x")
plot!(x10,y13,lab="exp(-x)")
end

# ╔═╡ d5e60bf2-37f5-11eb-2a46-fb5f663318ab
md" ### Inversas
Quiero hacer un grafico piola pero si defino exp(x) con x<0 y log(x) tengo error porque no existe el logaritmo de numeros negativos, tengo que ver como hacer para que quede un grafico mas lindo"

# ╔═╡ d5c55b26-37f5-11eb-2b24-d59b5a5d6b87
begin

j(u3)= exp(u3) 
u3 = collect(0:0.1:5)
y21=j.(u3)
k(u3)= log(u3) 
y22=k.(u3)
l(u3)=u3
y23=l.(u3)

plot(u3,y21,lab="exp(x)")
plot!(u3,y22,lab="log (x)")
plot!(u3,y23,lab="x")
xlims!(0,5)
ylims!(-3,8)

end

# ╔═╡ 4fca0274-3822-11eb-2042-99502890fd5a
md" ### Funciones hiperbolicas "

# ╔═╡ 4fc2dcf8-3822-11eb-0086-1701c4ee03d0
begin
c1(z1)= sinh(z1) 
z1 = collect(-5:0.01:5)
v1=c1.(z1)
#f11(z1)= (exp(z1) - exp(-z1))/2	#Como se escribe seno hiperbolico con exponenciales
#h11=f11.(z1)
c2(z1)= cosh(z1) 
v2=c2.(z1)
#f22(z1)= (exp(z1) + exp(-z1))/2	#Como se escribe coseno hiperbolico con exponenciales
#h22=f22.(z1)

c3(z1)=tanh(z1)
v3=c3.(z1)	
#f33(z1)= (exp(z1) - exp(-z1))/(exp(z1) + exp(-z1))	#Como se escribe coseno hiperbolico con exponenciales
#h33=f33.(z)

	
plot(z1,c1,lab="sinh")
#plot!(z1,h11,lab="exp(x)")
plot!(z1,c2,lab="cosh(x)")
plot!(z1,c3,lab="tanh(x)")
#plot!(z1,h3,lab="x")
#xlims!(-5,5)	
ylims!(-5,5)	
	
	
	
end

# ╔═╡ 4f80e828-3822-11eb-3993-3f7b71c75099


# ╔═╡ 4f55c706-3822-11eb-0f7e-4d682f126069


# ╔═╡ 4f384f30-3822-11eb-3a5b-df3d944441d4
md" ### Spoilers! 
Vamos a graficar una funcion cuadratica y el coseno

"

# ╔═╡ 2272e11e-376a-11eb-36b5-5f74bea758b6
begin 
f(x) = 1 - x^2/2
plot(cos, -pi/2, pi/2,label= "cos(x)")
plot!(f, -pi/2, pi/2, label = "1 - x²/2 ")
end

# ╔═╡ 2258877e-376a-11eb-326b-6f12fb4dcc83
md" 
Notan algo raro? 🧐

y si graficamos una recta y al seno? 🤔"

# ╔═╡ 223c801a-376a-11eb-3142-952f85c37cfd
begin 
p(x) = x
plot(sin, -pi/2, pi/2, label="sen(x)")
plot!(p, -pi/2, pi/2,label="x")
end

# ╔═╡ 22222d96-376a-11eb-1f2f-11af159774c1


# ╔═╡ 22046048-376a-11eb-12c8-9f0b009bf606


# ╔═╡ ae35e700-3756-11eb-0c34-7b1ba150fe0f
md"
### Composicion de funciones "

# ╔═╡ 63bee7a2-3826-11eb-0fdf-6d2c6e24acd9
begin

r1(x) = x^2
t1(x) = sin(x)
rt = r1 ∘ t1      # se escribe r1 \circ[tab] t1  y da la composicion
tr = t1 ∘ r1      # se escribe t1 \circ[tab] r1  y da la composicion
plt1=plot(r1,-2,2)
plt2=plot(t1,-2,2)	
plt3=plot(rt, -2, 2)
plt4=plot(tr, -2, 2)

plot(plt1,plt2,plt3,plt4, layout = 4 ,  label=["" "" "" ""],
title=[" x^2" "sen(x)" "sen(x²)" "sen(x)²"])

end

# ╔═╡ 63a4ff52-3826-11eb-1628-3bbd7a34609e


# ╔═╡ Cell order:
# ╠═a3658046-3725-11eb-1bb6-e981ac1de371
# ╠═80448600-3763-11eb-0426-071d4c5c2581
# ╠═b5ea471a-3725-11eb-09de-eb08414cea0c
# ╟─a88df786-376d-11eb-30bf-d36644f2462d
# ╟─6783a4fc-376d-11eb-32c9-c16376782b06
# ╟─920d6d1e-376d-11eb-169d-b7ba0fc2f787
# ╠═b02439b8-3756-11eb-08fc-a1ab31ae4b9e
# ╠═afcf8e22-3756-11eb-34ea-5376536fb482
# ╟─0bbab030-37e9-11eb-2d59-750dcc1389ed
# ╟─669fff32-37e9-11eb-0a8f-b9965e7fc876
# ╠═668188c0-37e9-11eb-2b79-21a9ad8c8045
# ╠═a54b80a2-37ef-11eb-1561-ff2eb53d96ff
# ╟─b9f68ee2-37f0-11eb-32b9-f5f8414a003f
# ╠═a59a24ae-37f0-11eb-27a7-4168be79ae76
# ╟─1c5b9714-37f2-11eb-2aee-c12c5b3378b6
# ╟─1bb527c8-37f2-11eb-392d-91cd73e93975
# ╟─fc574524-37f5-11eb-332f-e9240245e01c
# ╠═01f8039c-37f6-11eb-3cf1-0fb81e04cd85
# ╟─01d9c8c8-37f6-11eb-2d49-f7767d7422d1
# ╟─e340bc70-380e-11eb-2ea0-7d318e0b3b4f
# ╠═e9b6d660-380d-11eb-168f-15b5a4da6e25
# ╟─9f37e412-3817-11eb-3013-edf105cc933a
# ╟─6310dea6-3819-11eb-1466-977f16bc1521
# ╟─6fc7d4ba-3819-11eb-3c75-43f0a52000da
# ╠═8766aeb8-3819-11eb-0842-2169cb334dff
# ╠═38b55daa-381a-11eb-23e6-e1fca6acd232
# ╠═f98ab398-38c8-11eb-23e0-e7d53a94191f
# ╠═333bde28-38c9-11eb-1c13-43497cd11386
# ╟─d7194f12-381a-11eb-3cca-fbd7dc8882ad
# ╟─d691d366-381a-11eb-2204-6363ae55ff34
# ╟─85c0c7cc-38fa-11eb-0f1f-654ee2eb8909
# ╠═9420c8d4-38f8-11eb-2204-77a06514b0c0
# ╟─5fdedfea-38fe-11eb-154b-b1571a457c74
# ╠═af631940-3756-11eb-0744-59341550b719
# ╠═eaf5a3d2-37e8-11eb-3884-d7bef46081b1
# ╠═ea967346-37e8-11eb-3708-f7f5c68e008c
# ╟─afb7ef92-3756-11eb-0db6-6f726d587a4e
# ╠═af9a0036-3756-11eb-1581-f7f90b2744a4
# ╠═e915fed6-37e8-11eb-33b1-bfeeb67d9efc
# ╠═af7c90d2-3756-11eb-1e04-d7f1dbd0fa45
# ╠═af2d39ec-3756-11eb-29ba-73c6a59df0c9
# ╠═af1139ae-3756-11eb-1013-9738a6a3e83d
# ╠═aef666ce-3756-11eb-0c74-554cb9d31bae
# ╠═aedb7472-3756-11eb-1b58-0fc5a700fee0
# ╠═aebe3266-3756-11eb-32a4-17ff01f60908
# ╟─efbac940-3768-11eb-31ed-55e1dc275376
# ╟─aea292ce-3756-11eb-1dfd-1fd920be6ecf
# ╟─ae87bde6-3756-11eb-121a-211c9e728dae
# ╠═ae6c0470-3756-11eb-3293-37e5e5b7c425
# ╟─ae51af80-3756-11eb-082d-89b9a6c434e1
# ╠═7e68db0c-381b-11eb-3028-ef015cf632bf
# ╠═7e4bdd54-381b-11eb-32f8-d36c3b9c15a5
# ╠═7e30db44-381b-11eb-3e86-3bf955568345
# ╠═22f7bc0e-376a-11eb-39c6-9980c3c50e22
# ╟─d6d1a830-37f5-11eb-229f-65f8c08a8f62
# ╠═d6b126fa-37f5-11eb-3d79-4913a173eb30
# ╠═d6812770-37f5-11eb-36ad-b1ae4acb4338
# ╠═d65ee4ee-37f5-11eb-2c9d-4b309b276bd8
# ╠═d639c952-37f5-11eb-08d9-a53068c806c6
# ╠═d61e2bf2-37f5-11eb-0239-3380f1ed1093
# ╠═d60134c0-37f5-11eb-1306-799eef7788fe
# ╠═d5e60bf2-37f5-11eb-2a46-fb5f663318ab
# ╠═d5c55b26-37f5-11eb-2b24-d59b5a5d6b87
# ╠═4fca0274-3822-11eb-2042-99502890fd5a
# ╠═4fc2dcf8-3822-11eb-0086-1701c4ee03d0
# ╠═4f80e828-3822-11eb-3993-3f7b71c75099
# ╠═4f55c706-3822-11eb-0f7e-4d682f126069
# ╟─4f384f30-3822-11eb-3a5b-df3d944441d4
# ╠═2272e11e-376a-11eb-36b5-5f74bea758b6
# ╠═2258877e-376a-11eb-326b-6f12fb4dcc83
# ╠═223c801a-376a-11eb-3142-952f85c37cfd
# ╠═22222d96-376a-11eb-1f2f-11af159774c1
# ╠═22046048-376a-11eb-12c8-9f0b009bf606
# ╟─ae35e700-3756-11eb-0c34-7b1ba150fe0f
# ╠═63bee7a2-3826-11eb-0fdf-6d2c6e24acd9
# ╠═63a4ff52-3826-11eb-1628-3bbd7a34609e
