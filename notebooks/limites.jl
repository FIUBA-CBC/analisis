### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ c8f1d2a8-7dc3-11eb-1c9d-d96809f7eaba
using Plots


# ╔═╡ c8e809e4-7dc3-11eb-1d35-b76e523b25ed
using PlutoUI

# ╔═╡ c8e411cc-7dc3-11eb-1668-77c1fdbb98af
plotly()

# ╔═╡ 288cb56a-7d3e-11eb-2886-8b62af117de1
md"# 2 - Límites y continuidad

## Intuición

Hemos en los apuntes anteriores visto que en algunos casos, las funciones pueden no estar definidas en uno o más puntos determinados, pero si en el resto de los puntos de la recta real. Por ejemplo, $f(x)=\frac{1}{x}$ es una función que no está definida para $x = 0$, y $f(x)=ln(x)$ no está definida para $x <= 0$.

Nos puede interesar, dado que no podemos evaluar la función en estos puntos, ver que pasa cuando nos acercamos a ellos. 
"

# ╔═╡ 5c6e1670-7dc1-11eb-2846-7bbf9b4a70cb
begin
	y(x) = 1/x
	plot(y, xlims = (-3,3), ylims=(-100,100))
end

# ╔═╡ 622bd716-7dc4-11eb-17b5-97f1a89e02a2
begin
	g(x) = log(x)
	plot(g, -1,5)
end

# ╔═╡ 85a147f2-7d3e-11eb-2f91-4d0ab9761152
md"En estos casos podemos ver que $f(x)=ln(x)$, conforme nos acercamos a $x = 0$, $f(x)$ se vuelve negativa y tomando valores muy grandes en módulo. De hecho, podrá tomar valores tan grandes como queramos! 

Algo parecido pasa con $f(x) = \frac{1}{x}$, pero con una particularidad: si nos acercamos a $x = 0$ 'viniendo' desde los valores de $x$ negativos, $f(x)$ tomará valores negativos de módulo arbitrariamente grandes, mientras que si nos acercamos a $x = 0$ pero desde los valores de $x$ positivos, $f(x)$ tomará valores positivos de módulo arbitrariamente grandes.

En el siguiente *coso*, podrás ver como al variar el valor de $x$, cada vez que se acerca más al $0$, el valor de $f(x)$ va aumentando *reescribir* "

# ╔═╡ dd4b175c-7d3f-11eb-17ff-07bb4ec1d911
md"*Acá poner un slider con x y un gráfico de 1/x que muestre el valor para el x elegido*"

# ╔═╡ f5021666-7d3f-11eb-0a7f-9372010cec37
md"Vamos a un caso algo más raro: que pasa con la función $f(x) = \frac{sen(x)}{x}$ cuando $x$ se acerca a 0? Una vez más la función no está definida en $x = 0$ porque tenemos una $x$ dividiendo."


# ╔═╡ 993f8f62-7d40-11eb-1960-538cacde63a0
begin
	f(x)=sin(x)/x
	plot(f, -4,4)
end

# ╔═╡ 5bb672f8-7d40-11eb-1909-95f093f42801
md"Acá podemos ver que la función no se va hacia el infinito, sino que parece acercarse a un punto particular, casi como si fuese una función continua y su valor $f(0) = 1$. (ver si se puede poner en una cajita) Pero no lo es! En $x = 0$ la función no está definida! Veremos que podemos hacer al respecto más adelante.

Como antes, podés variar el valor de $x$ acercandote a 0 para ver como $f(x)$ se acerca a 1. Ojo, por redondeo del sistema, puede que te muestre el resultado como '1', pero en realidad, es un número muy muy cercano a 1, pero menor.
"

# ╔═╡ 59faa34e-7d40-11eb-0f92-7533626b6285
md"*Acá poner un slider con x y un gráfico de sen(x)/x que muestre el valor para el x elegido*"

# ╔═╡ 84a1f818-7d40-11eb-2645-0f39f6e87b96
md"
### Definición de límite

Pasemos ahora a una definición formal de límite en términos matemáticos.

Sea una función $f(x)$ definida en todos los puntos de un intervalo alrededor de un punto determinado $x_0$, incluyendo este punto o no.

Si para cada número $\epsilon >0$ existe un número $\delta > 0$ tal que:

si $0<|x-x_0|<\delta$ entonces $0<|f(x)-L|<\epsilon$

en tal caso podemos decir que $lim_{x \rightarrow 0}f(x) = L$

Tratemos de traducir esto al español: $\epsilon$ es el valor máximo de la diferencia entre el límite L, y el valor de la función $f(x)$ en un intervalo, y $\delta$ es el 'ancho' del intervalo.

Entonces, yo 'elijo' un $\epsilon$, y con ese valor fijo, tengo que poder encontrar un $\delta$ que me garantice que para todos los $x$ dentro del intervalo $(x_0 - \delta : x_0+\delta)$, todos los $f(x)$ correspondientes tienen que estar en el intervalo $(L-\delta:L+\delta)$. Si ese $\delta$ existe para cualquier $\epsilon$ que elija, entonces puedo decir que el límite de $f(x)$ cuando $x$ tiende a $x_0$ es $L$."

# ╔═╡ 61b58e0c-7dc5-11eb-29a6-2bbda11fd824


# ╔═╡ 3ef925ae-7d41-11eb-1bbe-9f4f9b290ddc
md"
### Funciones que tienden a infinito

Esta definición matemática nos sirve para casos como el de $f(x)=\frac{sen(x)}{x}$ donde existe un límite en un valor $L$, pero vimos al principio casos en donde la función 'tiende a infinito'.

Conceptualmente, son situaciones donde, cuanto más me acerco al valor $x_0$, más grande (en módulo) es el valor $f(x)$, y vemos que la gráfica de la función se va acercando cada vez más a una 'recta' en el eje Y.

Diremos entonces que el límite de $f(x)$ cuando $x$ tiende a $x_0$ es infinito (positivo) cuando para todo $R > 0$ existe un $\delta$ tal que para todo $x$ en el dominio de $f(x)$, si $0<|x-x_0|<\delta$, entonces $f(x) > R$.

Lo escribimos como $lim_{x -> x_0} f(x) = + \infty$

Asimismo, diremos que el límite de $f(x)$ cuando $x$ tiende a $x_0$ es infinito (negativo) cuando para todo $R > 0$ existe un $\delta$ tal que para todo $x$ en el dominio de $f(x)$, si $0<|x-x_0|<\delta$, entonces $f(x) < -R$.

Lo escribimos como $lim_{x -> x_0} f(x) = - \infty$
"

# ╔═╡ 6cf0b026-7d41-11eb-0d2a-6b23acaaf35c
md"
## Límites en el infinito

Nos puede interesar también que pasa con la función cuando la variable tiende ya no a un valor determinado, sino cuando tiende a infinito, es decir, cuando se hace arbitrariamente grande.

En algunos casos, veremos que la función se acerca mucho a un determinado valor, pero nunca 'llega', 

No podemos en este caso hablar de un valor $\delta$ que defina un intervalo alrededor del valor $x_0$, entonces hablaremos de un valor $T$, y diremos que si para cada número $\epsilon$ positivo, existe un número T tal que si $x>T$, entonces $|f(x)-L|<\epsilon$.

En español, yo defino que tan 'cerca' ($\epsilon$) de $L$ quiero que la función esté, y tengo que poder encontrar un número $T$ para el cual el valor de la función esté a '$\epsilon$' o menos de $L$ siempre que la evalúe en cualquier número mayor o igual a $T$.
"

# ╔═╡ d47d9cdc-7d42-11eb-2dd6-116cc2b855e0
md"### Asíntotas

El concepto de límite está fuertemente relacionado con otro concepto, tomado de la geometría, que es el da las rectas asíntotas. Una asíntota es una recta que se aproxima progresivamente a una curva, sin llegar en ningún punto a tocarla.

Así, cuando hablamos de que $lim_{x \rightarrow \infty}f(x) = L$, podemos pensar en una recta horizontal $y = L$ y ver que, conforme las $x$ tienden a infinito, las $f(x)$ tienden a $L$ (por definición), y entonces la curva de la función se 'acerca' cada vez más a la recta que definimos.

// Plot de $f(x)= 1/x + 1$ vs $y = L$

Entonces podemos definir $x = L$ es una asíntota horizontal de $f(x)$ si $lim_{x \rightarrow +\infty}f(x) = L$, o si $lim_{x \rightarrow -\infty}f(x) = L$.

Vamos ahora al caso en que $lim_{x -> x_0} f(x) = + \infty$. En esta circunstancia, podemos imaginar una recta vertical, $x = x_0$, 
"

# ╔═╡ d3ff3b58-7d42-11eb-1fec-273704dab6c8


# ╔═╡ Cell order:
# ╠═c8f1d2a8-7dc3-11eb-1c9d-d96809f7eaba
# ╠═c8e809e4-7dc3-11eb-1d35-b76e523b25ed
# ╠═c8e411cc-7dc3-11eb-1668-77c1fdbb98af
# ╠═288cb56a-7d3e-11eb-2886-8b62af117de1
# ╠═5c6e1670-7dc1-11eb-2846-7bbf9b4a70cb
# ╠═622bd716-7dc4-11eb-17b5-97f1a89e02a2
# ╟─85a147f2-7d3e-11eb-2f91-4d0ab9761152
# ╠═dd4b175c-7d3f-11eb-17ff-07bb4ec1d911
# ╠═f5021666-7d3f-11eb-0a7f-9372010cec37
# ╠═993f8f62-7d40-11eb-1960-538cacde63a0
# ╠═5bb672f8-7d40-11eb-1909-95f093f42801
# ╠═59faa34e-7d40-11eb-0f92-7533626b6285
# ╠═84a1f818-7d40-11eb-2645-0f39f6e87b96
# ╠═61b58e0c-7dc5-11eb-29a6-2bbda11fd824
# ╟─3ef925ae-7d41-11eb-1bbe-9f4f9b290ddc
# ╟─6cf0b026-7d41-11eb-0d2a-6b23acaaf35c
# ╟─d47d9cdc-7d42-11eb-2dd6-116cc2b855e0
# ╠═d3ff3b58-7d42-11eb-1fec-273704dab6c8
