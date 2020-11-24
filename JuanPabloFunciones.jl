### A Pluto.jl notebook ###
# v0.12.11

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

# ╔═╡ 2861d22e-2e4b-11eb-0dff-315e2defde09
using Plots

# ╔═╡ 5d5814b6-2d8d-11eb-1b45-e906e2b2d677


# ╔═╡ d5e3aefe-2d8d-11eb-0ad9-1b2266938468
plotly()

# ╔═╡ 8534411c-2d8d-11eb-297c-c90be16a571a
#begin
	#f(x)= x^2
	#x=collect(-1:0.1:2) #El collect me hace un vector (inicio:paso:fin)
	#y=f.(x)
	#plot(x,y)
#end

# ╔═╡ 85868434-2d8d-11eb-1913-67a967bf53d1
#begin
#	h(g) = g^2
#	plot(f,-1,2)
#end

# ╔═╡ c70a3ad6-2d8f-11eb-004f-eb5031904631
md"""
### Parametros para definir un ploteo
- `color` o `c`: Simbolo del color, o "RRGGBB", o RGB (r, g , b) 
- `linewitdth` o `lw` : el grosor de la linea
- `label` o `lab` : texto de la leyenda
- `marker` o `m` : marcador
- `markersize` o `ms` : tamaño del marcador

"""

# ╔═╡ 62e9ace8-2d90-11eb-0031-5b47ba2e2859
begin
t(u)= exp(-u) * sin(u)  + cos(u)*exp(u)
u = collect(-2:0.1:2)
i=t.(u)
plot(u,i, color=:red, lw=2, lab="f", m=:circle, ms=2)
end



# ╔═╡ 3a3a7fec-2d96-11eb-3d74-35d60a54140c
md"""
Vuelvo a plotear

"""

# ╔═╡ 1b4b829c-2d97-11eb-2b6e-4bb26c36fc75
#begin
#	x=collect(-0.2:0.1:2π)
#	ycos=cos.(x)
#	ysin=sin.(x)
#	plot(x,ycos, c=:blue, lab="coseno")
#	plot!(x,ysin, c=:red ,lab="seno")
#	plot!([-0.2,2π+0.2],[1,1], c=:green , lab="", l=:dash)
#	plot!([-0.2,2π+0.2],[-1,-1], c=:green , lab="" ,l=:dash)
#
#	xlims!(-0.2,2π+0.2)
#	ylims!(-1.1,1.1)
#	xticks!(0:π/2:2π,["0", "π/2", "π","3π/2","2π"])
#	yticks!([-1,0,1])
#end

# ╔═╡ 51735a70-2dc2-11eb-2d52-95460a85b1ce
md"""
### Escalado y reflejo horizontal y vertical

Supongamos que tenemos un c > 1 . Veremos como se puede modificar la funcion f(x)

- `y = c * f(x)` estira el grafico de `y = f(x)` verticalmente por un factor de `c` 
- `y = 1/c * f(x)` achica el grafico de `y = f(x)` verticalmente por un factor de `c` 
- `y = f(c x)` estira el grafico de `y = f(x)` horizontalmente por un factor de `c` 
- `y = f(x/c)` achica el grafico de `y = f(x)` horizontalmente por un factor de `c`
- `y = -f(x)` refleja el grafico de `y = f(x)` respecto el `eje x`
- `y = f(-x)` refleja el grafico de `y = f(x)` respecto el `eje y`

"""

# ╔═╡ 8658e3f6-2dcc-11eb-3208-7d9321d246ec
begin
	cslider = @bind  c html"<input type=range min=-3 max=10>"
	

		md"""**Deslizá para cambiar el valor de la constante `c`:**
	
		$(cslider)"""


end

# ╔═╡ 28efd220-2dd0-11eb-2369-790e6695662b
md"El valor de `c` es:  $(c)"

# ╔═╡ d31cb54a-2da0-11eb-2a48-3955ced0f035
begin
f(x)= x^3 + x^2
x = collect(-2:0.1:2)
y=f.(x)
plot(x,y,lab="f(x)")
plot!(-x,y, lab="f(-x)")
plot!(x,-y,lab="-f(x)")
plot!(1/c*x,y,lab="1/c f(x)")
plot!(c*x,y,lab="c f(x)")
end


# ╔═╡ f8a9f880-2dc7-11eb-025b-3d95c7d64866
md"""
Voy a usar otro tipo de ploteo porque no se como arreglar el error 

"""

# ╔═╡ 7ad61608-2dc9-11eb-1e74-9b4b7403bf87
md"""
### Traslaciones de la funcion 

Supongamos que tenemos un c > 1 . Veremos como se puede modificar la funcion f(x)

- `y = f(x) + c` mueve el grafico de `y = f(x)` una distancia `c` hacia arriba
- `y = f(x) - c` mueve el grafico de `y = f(x)` una distancia `c` hacia abajo
- `y = f(x-c)` mueve el grafico de `y = f(x)` una distancia `c` hacia la derecha
- `y = f(x-c)` mueve el grafico de `y = f(x)` una distancia `c` hacia la izquierda
"""

# ╔═╡ b3045652-2dcb-11eb-2477-0f04f01dfd2b
begin
	dslider = @bind  d html"<input type=range min=-2 max=10>"
	

		md"""**Deslizá para cambiar el valor de la constante `d`:**
	
		$(dslider)"""


end

# ╔═╡ bd1858e4-2dd7-11eb-1d04-0554484994b4
md"El valor de `d` es:  $(d)"

# ╔═╡ 1c3609ac-2d97-11eb-31c9-85dce2fb653c
begin
#Esta es la funcion que podes modificar a gusto
g(x)=cos(x)

g1(x)= g(x-d)
g2(x)= g(x+d)
g3(x)= g(x) + d
g4(x)= g(x) - d
#plot([g,g1,g2,g3,g4],-2π,2π)
plot(g,-2π,2π,lab="f(x)")
plot!(g1,-2π,2π,lab="f(x-d)")
plot!(g2,-2π,2π,lab="f(x+d)")
plot!(g3,-2π,2π,lab="f(x)+ d")
plot!(g4,-2π,2π,lab="f(x) -d")

end

# ╔═╡ e78a2b76-2def-11eb-138a-e757a982c886
md"""
### Funciones pares e impares
Si una funcion `f`  satisface que `f(-x)=f(x)` para cada `x` de su dominio, entonces esta es llama funcion par. por ejemplo la funcion `f(x)=x^2` es par porque:
`f(-x)=(-x)²=x²=f(x)²` como se obseva en la siguiente figura:
En cambio si se cumple
"""


# ╔═╡ 6df97fa0-2e42-11eb-222c-e34309dac678
begin
plot(x, x.^2 .-2,lab="x²" )
end

# ╔═╡ 3379ef62-2e45-11eb-0248-2521a3184e15
md"""
 
En cambio si se cumple que `f(-x)=-f(x)` para cada x de su dominio la funcion se llama impar. Un ejemplo es la funcion `f(x)=x³`
"""


# ╔═╡ 7da0159e-2e45-11eb-06fd-893f62e15c72
begin
plot(x, x.^3 .-2,lab="x³" )
end

# ╔═╡ f496616c-2d96-11eb-3783-b1111bc203be
md"""
### Álgebra de funciones 

Sean `f` y `g` dos funciones con sus respectivos domminios `D(f)` y `D(g)` respectivamente Estas pueden ser sumadas, restadas y multiplicadas en la interseccion de dichos dominions, esto es
- `(f+g)(x) = f(x) + g(x)` (adicion)
- `(f-g)(x) = f(x) - g(x)` (sustaccion)
- `(fg)(x) = f(x)  g(x)` (multiplicacion)

- Y en los puntos `x` donde `g(x) =! 0` ,  `f` puede ser dividido por `g` mediante `f/g (x) ` = `f(x)/g(x)`"""

# ╔═╡ ea4eeb70-2d96-11eb-17d2-699b37f52ca7
md" #### Veamos unos ejemplos:"

# ╔═╡ fe7c64d6-2dd9-11eb-1edb-955adfa35ed2
begin
#Esta es la funcion que podes modificar a gusto
e(x)=cos(x)
r(x)=sin(x)
t1(x)= e(x) + r(x)
t2(x)= e(x) - r(x)
t3(x)= e(x) * r(x)
t4(x)=r(x) / e(x)


plot(e,-2π,2π,lab="e(x)")
plot!(r,-2π,2π,lab="r(x)")
plot!(t1,-2π,2π,lab="(e+r)(x)")
plot!(t2,-2π,2π,lab="(e-r)(x)")
plot!(t3,-2π,2π,lab="(e*r)(x)")
#plot!(t4,-2π,2π,lab="(r/e)(x)")
#xlims!(-0.2,2π+0.2)
#ylims!(-1.1,1.1)
xticks!(-2π:π/2:2π,["-π/2", "-π","-3π/2","-2π","0", "π/2", "π","3π/2","2π"])
yticks!([-1,0,1])
end

# ╔═╡ abb88f56-2e45-11eb-1dd2-dbe50f987a01


# ╔═╡ db3893b8-2e45-11eb-2c30-c9c5ef61ad66


# ╔═╡ da92a1cc-2e45-11eb-1054-2df5b376f098


# ╔═╡ 34230f7e-2ddd-11eb-2b36-05fce35c9d5d
md"""
### Funcion lineal 

Cuando decimos que una funcion es `y` es una funcion lineal de `x`, queremos decir que el grafico de esta es una linea recta, por lo que podemos utilizar la forma `pendiente  (m)` - `ordenada(b)` al origen para describir la funcion:
`y= f(x) = m x + b`

Una de las caracteristicas de las funcione slineales es que cambian a una tasa constante. Por ejemplo en la siguiente figura se observa el grafico de una funcion lineal `f(x) = 3 x -2` , se puede ver que a medida que `x` aumenta en `0,1` , el valor de `y` lo hace en `0,3` , entonces `f(x)` aumenta su valor tres veces mas rapido que `x`. Esto significa que la pendiente de la recta puede ser visto como la tasa de crecimiento dA characteristic feature of linear functions is that they change at a constant ratee `y` respecto a `x`
"""

# ╔═╡ 6c86096e-2ddf-11eb-184f-a1dcd9ffc51a
begin
plot(x, x.*3 .-2,m=:circle) 
xlims!(0,1)
ylims!(-1.1,1.1)
end

# ╔═╡ 903d5c66-2de6-11eb-0468-d353e66abc72
md" Veamos que pasa si cambiamos la pendiente y la ordenada al origen"



# ╔═╡ e3419e5e-2de6-11eb-334e-e31291f26470
begin
	mslider = @bind m html"<input type=range min=-2 max=10>"
	bslider = @bind b html"<input type=range min=-2 max=10>"
	md"""Pendiente: m $(mslider)
	

	Termino independiente: b $(bslider)"""
end

# ╔═╡ 866edeaa-2de7-11eb-0684-e3583e28900f
md"El valor de `b` es: $(b)"


# ╔═╡ 38506ff6-2de7-11eb-107f-f7f298d0a74e
md"El valor de `m` es: $(m)"


# ╔═╡ 9ce9474e-2de7-11eb-2905-ffd26a67efc3
begin
plot(x, x.*m .+b) 
xlims!(-3,3)
ylims!(-10,10)
end

# ╔═╡ cf0cff56-2de0-11eb-0b1c-55bb1e8f754c
md"### Ejemplo 1

A medida que aire seco sube, se expande y enfria. Si la temperatura en el nivel del suelo es de `20°C` y la temperatura a 1km es de `10°C`, ¿Cúal será la temperatura (en °C) en funcion de la altura `h` (en kilometros)? 
asumir que un modelo lineal es apropiado

------

Como asumimos un modelo linal podemos asumir que la temperatura viene dada por la ecuacion `T(h) = mh + b` . Como sabemos que la temperatura al nivel del suelo es de 20°C podemos escribir `20= m . 0 + b`, de donde obtenemos que b = 20, es decir que 20 es la ordenada al origen.
Además sabemos que a 1km la temperatura es de 10°C , que en terminos de la ecuacion implica 10 = m . 1 + 20, por lo que la pendiente resulta `m = 10 -20 = -1`
Finalmente podemos escribir que `T=-10h +20 es laa funcion que describe la temperatura del aire en funcion de la altura

Graficando tenemos
"

# ╔═╡ 7ecb96e4-2de3-11eb-0f96-b32a65e52afa
begin 
h = collect(0:0.1:7)
plot(h,h.*-10 .+20,lab="T=-10h+20")
xlims!(0,5)
ylims!(-30,30)
end
#Falta mejorar el grafico

# ╔═╡ 03697c58-2de5-11eb-0c69-f13cd610f962
md" ## Rectas  paralelas y  ortogonales 
supongamos que tenemos una recta de la forma , 
`y= f(x) = m x + b`

Veamos que pasa si tenemos las funciones: 
`y1= 2 x + -2` ; `y2= 4 x + -2` ; `y3= -1/2 x + -2`


"
#No se que pasa que no se ven perpendiculares


# ╔═╡ 460541ec-2de9-11eb-33eb-ed5958b03228
begin
plot(x, x.*2 .-2) 
plot!(x, x.*2 .+2)
plot!(x, x.*(-1/2))
xlims!(-2.5,2.5)
ylims!(-2.5,2.5)



end

# ╔═╡ 45959bd8-2e40-11eb-19b9-495bd1535392
md" ### Otra forma de ver las familias de las funciones escenciales

#### Potencias"

# ╔═╡ c5d8a816-2e4b-11eb-29e4-f79ac2268f64
begin
p1=plot(x, x.^2)
p2=plot(x, x.^3)
p3=plot(x, x.^4)
p4=plot(x, x.^5)
	
plot(p1,p2,p3,p4 ,layout = 4, label=["" "" "" ""],
title=["x²" "x³" "x⁴" "x⁵"])
end

# ╔═╡ 2031f2de-2e4e-11eb-11b0-db68ea469147
md" 

#### Funciones reciprocas"

# ╔═╡ 44756e64-2e4e-11eb-1ba6-07e207a08b46
begin
r1=plot(x,x.^(-1) )
r2=plot(x,x.^(-2) )
r3=plot(x,x.^(-3) )
r4=plot(x, x.^(-4))
	
plot(r1,r2,r3,r4 ,layout = 4, label=["" "" "" ""],
title=["1/x" "1/x²" "1/x³" "1/x⁴"])
end



# ╔═╡ cd1a54f6-2e68-11eb-3cfb-29a25c586dac
md" #### Composicion de funciones
Tenemos una `f(x)= x^3 + x^2` y se define una  `g(f(x)) = f(x)²`
veamos como son los graficos"


# ╔═╡ 7c530468-2e67-11eb-29a1-c9ce5599fe1a
begin 
	function f(x,y)
		y.^2
	end
	plot(y,label="f(x)")
	plot!(f(x,y),label="g(f(x))")
end

# ╔═╡ 378acc96-2e6a-11eb-20a1-c942dbab9f8a
md" ### Volviendo con las funciones trigonometricas 
###### Veamos como cambian su forma segun las constantes que tengan definiendolas
siendo dos funciones `f(x) = A cos(z w)` y `g(x) = A sen(z w)` "


# ╔═╡ b499708c-2e6c-11eb-3fe9-6f3db58f3647
begin
	aslider = @bind a html"<input type=range min=-2 max=10>"
	zslider = @bind z html"<input type=range min=-2 max=10>"
	md"""Amplitud: a $(aslider)
	

	Frecuencia: z $(zslider)"""
end

# ╔═╡ b9a538f2-2e6c-11eb-1cd6-c90410483895
md"El valor de `a` es: $(a)"


# ╔═╡ bc9800c8-2e6c-11eb-2758-73b1b2e5f991
md"El valor de `z` es: $(z)"


# ╔═╡ 54973ca6-2e6b-11eb-02f0-2de109392772
begin
	
	w=collect(-2π:0.1:2π)
	plot(w, cos.(z*w).*a,label="Coseno")
	plot!(w, sin.(z*w).*a,label="Seno")

end

# ╔═╡ Cell order:
# ╠═2861d22e-2e4b-11eb-0dff-315e2defde09
# ╟─5d5814b6-2d8d-11eb-1b45-e906e2b2d677
# ╠═d5e3aefe-2d8d-11eb-0ad9-1b2266938468
# ╠═8534411c-2d8d-11eb-297c-c90be16a571a
# ╠═85868434-2d8d-11eb-1913-67a967bf53d1
# ╠═c70a3ad6-2d8f-11eb-004f-eb5031904631
# ╠═62e9ace8-2d90-11eb-0031-5b47ba2e2859
# ╟─3a3a7fec-2d96-11eb-3d74-35d60a54140c
# ╟─1b4b829c-2d97-11eb-2b6e-4bb26c36fc75
# ╠═51735a70-2dc2-11eb-2d52-95460a85b1ce
# ╟─8658e3f6-2dcc-11eb-3208-7d9321d246ec
# ╟─28efd220-2dd0-11eb-2369-790e6695662b
# ╠═d31cb54a-2da0-11eb-2a48-3955ced0f035
# ╟─f8a9f880-2dc7-11eb-025b-3d95c7d64866
# ╠═7ad61608-2dc9-11eb-1e74-9b4b7403bf87
# ╠═b3045652-2dcb-11eb-2477-0f04f01dfd2b
# ╠═bd1858e4-2dd7-11eb-1d04-0554484994b4
# ╠═1c3609ac-2d97-11eb-31c9-85dce2fb653c
# ╟─e78a2b76-2def-11eb-138a-e757a982c886
# ╟─6df97fa0-2e42-11eb-222c-e34309dac678
# ╟─3379ef62-2e45-11eb-0248-2521a3184e15
# ╠═7da0159e-2e45-11eb-06fd-893f62e15c72
# ╟─f496616c-2d96-11eb-3783-b1111bc203be
# ╟─ea4eeb70-2d96-11eb-17d2-699b37f52ca7
# ╠═fe7c64d6-2dd9-11eb-1edb-955adfa35ed2
# ╟─abb88f56-2e45-11eb-1dd2-dbe50f987a01
# ╟─db3893b8-2e45-11eb-2c30-c9c5ef61ad66
# ╟─da92a1cc-2e45-11eb-1054-2df5b376f098
# ╠═34230f7e-2ddd-11eb-2b36-05fce35c9d5d
# ╠═6c86096e-2ddf-11eb-184f-a1dcd9ffc51a
# ╟─903d5c66-2de6-11eb-0468-d353e66abc72
# ╠═e3419e5e-2de6-11eb-334e-e31291f26470
# ╠═866edeaa-2de7-11eb-0684-e3583e28900f
# ╠═38506ff6-2de7-11eb-107f-f7f298d0a74e
# ╠═9ce9474e-2de7-11eb-2905-ffd26a67efc3
# ╠═cf0cff56-2de0-11eb-0b1c-55bb1e8f754c
# ╟─7ecb96e4-2de3-11eb-0f96-b32a65e52afa
# ╠═03697c58-2de5-11eb-0c69-f13cd610f962
# ╠═460541ec-2de9-11eb-33eb-ed5958b03228
# ╠═45959bd8-2e40-11eb-19b9-495bd1535392
# ╠═c5d8a816-2e4b-11eb-29e4-f79ac2268f64
# ╠═2031f2de-2e4e-11eb-11b0-db68ea469147
# ╠═44756e64-2e4e-11eb-1ba6-07e207a08b46
# ╠═cd1a54f6-2e68-11eb-3cfb-29a25c586dac
# ╠═7c530468-2e67-11eb-29a1-c9ce5599fe1a
# ╠═378acc96-2e6a-11eb-20a1-c942dbab9f8a
# ╟─b499708c-2e6c-11eb-3fe9-6f3db58f3647
# ╟─b9a538f2-2e6c-11eb-1cd6-c90410483895
# ╟─bc9800c8-2e6c-11eb-2758-73b1b2e5f991
# ╠═54973ca6-2e6b-11eb-02f0-2de109392772
