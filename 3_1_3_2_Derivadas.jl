### A Pluto.jl notebook ###
# v0.12.20

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

# ╔═╡ c4caa3c2-6cc9-11eb-0eb1-d3d3c8902282
using Plots

# ╔═╡ 7e5c5f06-6cca-11eb-388b-879a356115b7
using PlutoUI

# ╔═╡ 98331a28-6d5b-11eb-2e6d-25dee733ce58
using ForwardDiff

# ╔═╡ c7d4d0ea-6ccb-11eb-2ab5-7df7d5771bfe
plotly()

# ╔═╡ 145e6a02-6ccc-11eb-2df4-ef3d83c049b0
import Pkg; Pkg.add("PyPlot")

# ╔═╡ 709c2c12-6d96-11eb-3475-c11e3ab1b92f
md"
#### Derivada
##### Derivada en un punto


$$\lim_{h \rightarrow 0} \frac{f(c+h) - f(c)}{h}.$$
"

# ╔═╡ 3ff2ea90-6d98-11eb-3d3d-751bec73f852
md"
##### Derivada de f(x)

$$\lim_{h \rightarrow 0} \frac{f(x+h) - f(x)}{h}.$$
"

# ╔═╡ a89dd090-6d76-11eb-22ba-e9e927935130
md"
#### Razón de cambio

Consideremos a $y$ una cantidad qu dependa de $x$. Es decir que $y$ es funcion de $x$ o lo que es lo mismo $f(x)=y$.  Si la cantidad $x$ cambia de $x_1$ a $x_2$, entonces el **incremento** de $x$ es:

$$\Delta x = x_2 - x_1$$

y el cambio correspondiente a $y$ es:

$$\Delta y = y_2 - y_1$$

El cociente entre ambas diferencias se llama  *razon de cambio promedio de $y$ respecto a $x$*.

$$\frac{\Delta y}{\Delta x}=\frac{(f(x_2) - f(x_1))} {(x_2 - x_1)}$$ 
La razon de cambio promedio de $y$ respecto a $x$ en un intervalo $[x_1,x_2]$ 

"

# ╔═╡ c55c0534-6d93-11eb-32ce-5bf9ec955f4d
md" Al hacer que el valor de $x_2$ tienda a $x_1$ la diferencia $\Delta x = x_2 - x_1 $ tiende a $0$. El limite de las razones de cambio en este caso sera una **razon de cambio instantanea** de $y$ respecto a $x$ en $x_0$, lo que puede ser interpretado como la pendiente de la recta tangente a la curva $y=f(x)$ en el punto $P(x_1,f(x_1))$

Veamos esto en los siguientes graficos
 "

# ╔═╡ b046a3a0-6cca-11eb-1a79-7f000447bc2c
md"

##### Notaciones 
>$$\frac{dy}{dx} =\frac{df}{dx}=\frac{d}{dx}f(x)\\\text{ Notacion de Leibniz}$$
>$$\dot{x} = x'(t)\ \text{Notacion de Newton}$$
> 
>
>$$f'(x)\ \text{Notacion de Lagrange}$$
>$$D_x f\ \text{Notacion de Euler}$$
"

# ╔═╡ db85c08e-6d95-11eb-0085-9f2d6e5551f6
md"
Rather than parameterize this problem using $a$ and $b$, we let $c$ and $c+h$ represent the two values for $x$, then the secant-line-slope formula becomes
"

# ╔═╡ dfa23760-6cd2-11eb-24bd-7d63869d1110
@bind n NumberField(1:10, default=1)

# ╔═╡ dd0410f6-6d92-11eb-1715-65f180f365be
# Agregar P y Q en los puntos

# ╔═╡ 07b142e2-6d45-11eb-0dc1-f96da6b845b3
begin
		fig_size=(600, 400)
		f(x) = sin(x)
		c = pi/3
		h = 1.5^(-n) * pi/4
		m = (f(c+h) - f(c))/h
		xs = collect(0:π/50:π)
		plt = plot(f, 0, pi, legend=false, size=fig_size)
		plot!(plt, xs, f(c) .+ cos(c)*(xs .- c), color=:orange)
		plot!(plt, xs, f(c) .+ m*(xs .- c), color=:black)
		scatter!(plt, [c,c+h], [f(c), f(c+h)], color=:orange, markersize=5)

		plot!(plt, [c, c+h, c+h], [f(c), f(c), f(c+h)], color=:gray30)
		annotate!(plt, [(c+h/2, f(c), text("Δx", :top)), (c + h + .05, (f(c) + f(c + h))/2, text("Δy", :left))])

		plt
	
end

# ╔═╡ f0b07f9c-6d58-11eb-18cd-67a9f5c51333
begin
	c1_slider=  @bind c1 Slider(-10:0.1:10; default=0, show_value=true)
	md"""c: $(c1_slider)"""
end

# ╔═╡ 2236f046-6d93-11eb-0fa3-9707669e0cb4
md" Disminui el valor de h para ver como se comporta la recta secante"

# ╔═╡ 5db203da-6d5d-11eb-3340-bbf8df077f9c
@bind h1 NumberField(0.001:0.01:0.5, default=1)
	

# ╔═╡ 442ad734-6d53-11eb-0d95-95c75cd29435
begin
	g(xs1) = sin(xs1)*xs1  # Funcion
	derivada=ForwardDiff.derivative(g, c1) # Cpn FowardDiff calculo la derivada 
	m1 = (g(c1+h1) - g(c1))/h1 # La pendiente de la secante
	xs1 = collect(-10:0.001:10) #Puntos a utilizar
	plot(g,-10:0.01:10,lab="funcion")
	plot!(xs1, g(c1) .+ derivada*(xs1 .- c1), color=:orange,lab="recta tangente =$derivada") #Grafico la recta tangente en el punto c
	scatter!([c1,c1+h1], [g(c1), g(c1+h1)], color=:orange, markersize=3,lab="")
	plot!(xs1, g(c1) .+ m1*(xs1 .- c1), color=:black,lab="recta secante")
	plot!([c1, c1+h1, c1+h1], [g(c1), g(c1), g(c1+h1)], color=:gray30,lab="")
	annotate!([(c1+h1/2, g(c1), text("h", :top)), (c1 + h1 + .05, (g(c1) + g(c1 + h1))/2, text("f(c+h) - f(c)", :left))])
	#ylims!(-2,10)
	#xlims!(-5,5)


end

# ╔═╡ 25ee72fe-6d9d-11eb-3d0a-e1f1909d53ba
md"
#### Derivadas superiores



"

# ╔═╡ Cell order:
# ╠═c4caa3c2-6cc9-11eb-0eb1-d3d3c8902282
# ╠═c7d4d0ea-6ccb-11eb-2ab5-7df7d5771bfe
# ╠═7e5c5f06-6cca-11eb-388b-879a356115b7
# ╠═145e6a02-6ccc-11eb-2df4-ef3d83c049b0
# ╠═709c2c12-6d96-11eb-3475-c11e3ab1b92f
# ╠═3ff2ea90-6d98-11eb-3d3d-751bec73f852
# ╠═a89dd090-6d76-11eb-22ba-e9e927935130
# ╠═c55c0534-6d93-11eb-32ce-5bf9ec955f4d
# ╠═b046a3a0-6cca-11eb-1a79-7f000447bc2c
# ╠═db85c08e-6d95-11eb-0085-9f2d6e5551f6
# ╠═dfa23760-6cd2-11eb-24bd-7d63869d1110
# ╠═dd0410f6-6d92-11eb-1715-65f180f365be
# ╠═07b142e2-6d45-11eb-0dc1-f96da6b845b3
# ╠═f0b07f9c-6d58-11eb-18cd-67a9f5c51333
# ╠═98331a28-6d5b-11eb-2e6d-25dee733ce58
# ╟─2236f046-6d93-11eb-0fa3-9707669e0cb4
# ╟─5db203da-6d5d-11eb-3340-bbf8df077f9c
# ╠═442ad734-6d53-11eb-0d95-95c75cd29435
# ╠═25ee72fe-6d9d-11eb-3d0a-e1f1909d53ba
