### A Pluto.jl notebook ###
# v0.12.12

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

# ╔═╡ c6dd95c0-376d-11eb-36ef-ddce37edefd7
md" 
###### Nuestra idea es que este curso sea algo distinto para que nunca te sientas en una clase de matematica para serpientes como en Rick y Morty , asi que abrochate el cinturon de seguridad que arrancamo'
"

# ╔═╡ b02439b8-3756-11eb-08fc-a1ab31ae4b9e
md"""
### Funcion lineal 

Cuando decimos que una funcion es `y` es una funcion lineal de `x`, queremos decir que el grafico de esta es una linea recta, por lo que podemos utilizar la forma `pendiente  (m)` - `ordenada(b)` al origen para describir la funcion:
`y= f(x) = m x + b`

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
md" ### Ejemplo - BsAs Mar del Plata"

# ╔═╡ 669fff32-37e9-11eb-0a8f-b9965e7fc876


# ╔═╡ 668188c0-37e9-11eb-2b79-21a9ad8c8045
begin 
x1 = collect(0:0.1:7) # armo un vector de 0 a 7 con incrementos de 0.1
plot(x1,x1.*10,lab="x=v*t") # h es la funcion a plotear h. hace que todo el vector sea afectado por lo que sigue, en este caso una multiplicacion y luego una suma
xlims!(-0.1,5)
ylims!(0,30)
end

# ╔═╡ af631940-3756-11eb-0744-59341550b719
md"### Ejemplo 1

A medida que aire seco sube, se expande y enfria. Si la temperatura en el nivel del suelo es de `20°C` y la temperatura a 1km es de `10°C`, ¿Cúal será la temperatura (en °C) en funcion de la altura `h` (en kilometros)? 
asumir que un modelo lineal es apropiado

------

Como asumimos un modelo linal podemos asumir que la temperatura viene dada por la ecuacion `T(h) = mh + b` . Como sabemos que la temperatura al nivel del suelo es de 20°C podemos escribir `20= m . 0 + b`, de donde obtenemos que b = 20, es decir que 20 es la ordenada al origen.
Además sabemos que a 1km la temperatura es de 10°C , que en terminos de la ecuacion implica 10 = m . 1 + 20, por lo que la pendiente resulta `m = 10 -20 = -1`
Finalmente podemos escribir que `T=-10h +20` es laa funcion que describe la temperatura del aire en funcion de la altura

Graficando tenemos
"

# ╔═╡ af4b80b4-3756-11eb-357f-ad64f70bd092
#Acá use esta forma de definir la funcion para mostrar que tambien se puede asi y por ahi en algunos casos es mas cómodo. 

begin 
h = collect(0:0.1:7) # armo un vector de 0 a 7 con incrementos de 0.1
plot(h,h.*-10 .+20,lab="T=-10h+20") # h es la funcion a plotear h. hace que todo el vector sea afectado por lo que sigue, en este caso una multiplicacion y luego una suma
xlims!(0,5)
ylims!(-30,30)
end
#Falta mejorar el grafico

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

# ╔═╡ 22f7bc0e-376a-11eb-39c6-9980c3c50e22


# ╔═╡ 2272e11e-376a-11eb-36b5-5f74bea758b6


# ╔═╡ 2258877e-376a-11eb-326b-6f12fb4dcc83


# ╔═╡ 223c801a-376a-11eb-3142-952f85c37cfd


# ╔═╡ 22222d96-376a-11eb-1f2f-11af159774c1


# ╔═╡ 22046048-376a-11eb-12c8-9f0b009bf606


# ╔═╡ ae35e700-3756-11eb-0c34-7b1ba150fe0f
md"
### Composicion de funciones "

# ╔═╡ Cell order:
# ╠═a3658046-3725-11eb-1bb6-e981ac1de371
# ╠═80448600-3763-11eb-0426-071d4c5c2581
# ╠═b5ea471a-3725-11eb-09de-eb08414cea0c
# ╟─a88df786-376d-11eb-30bf-d36644f2462d
# ╟─6783a4fc-376d-11eb-32c9-c16376782b06
# ╟─920d6d1e-376d-11eb-169d-b7ba0fc2f787
# ╟─c6dd95c0-376d-11eb-36ef-ddce37edefd7
# ╟─b02439b8-3756-11eb-08fc-a1ab31ae4b9e
# ╟─afcf8e22-3756-11eb-34ea-5376536fb482
# ╠═0bbab030-37e9-11eb-2d59-750dcc1389ed
# ╠═669fff32-37e9-11eb-0a8f-b9965e7fc876
# ╠═668188c0-37e9-11eb-2b79-21a9ad8c8045
# ╟─af631940-3756-11eb-0744-59341550b719
# ╠═af4b80b4-3756-11eb-357f-ad64f70bd092
# ╠═eaf5a3d2-37e8-11eb-3884-d7bef46081b1
# ╠═ea967346-37e8-11eb-3708-f7f5c68e008c
# ╟─afb7ef92-3756-11eb-0db6-6f726d587a4e
# ╟─af9a0036-3756-11eb-1581-f7f90b2744a4
# ╠═e915fed6-37e8-11eb-33b1-bfeeb67d9efc
# ╠═af7c90d2-3756-11eb-1e04-d7f1dbd0fa45
# ╠═af2d39ec-3756-11eb-29ba-73c6a59df0c9
# ╠═af1139ae-3756-11eb-1013-9738a6a3e83d
# ╠═aef666ce-3756-11eb-0c74-554cb9d31bae
# ╟─aedb7472-3756-11eb-1b58-0fc5a700fee0
# ╠═aebe3266-3756-11eb-32a4-17ff01f60908
# ╟─efbac940-3768-11eb-31ed-55e1dc275376
# ╟─aea292ce-3756-11eb-1dfd-1fd920be6ecf
# ╟─ae87bde6-3756-11eb-121a-211c9e728dae
# ╠═ae6c0470-3756-11eb-3293-37e5e5b7c425
# ╟─ae51af80-3756-11eb-082d-89b9a6c434e1
# ╠═22f7bc0e-376a-11eb-39c6-9980c3c50e22
# ╠═2272e11e-376a-11eb-36b5-5f74bea758b6
# ╠═2258877e-376a-11eb-326b-6f12fb4dcc83
# ╠═223c801a-376a-11eb-3142-952f85c37cfd
# ╠═22222d96-376a-11eb-1f2f-11af159774c1
# ╠═22046048-376a-11eb-12c8-9f0b009bf606
# ╟─ae35e700-3756-11eb-0c34-7b1ba150fe0f
