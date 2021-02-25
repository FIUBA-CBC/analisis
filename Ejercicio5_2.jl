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

# ╔═╡ 5c83de46-770a-11eb-0e81-db961793fb2e
using Plots

# ╔═╡ 4ffe10c4-770f-11eb-223d-5d8efc8942e9
using PlutoUI

# ╔═╡ 8248198c-770b-11eb-2e1e-eba2a0135144
using ForwardDiff

# ╔═╡ a59e1984-770a-11eb-131c-6f2a0eb87e49
plotly()

# ╔═╡ c62a7ca6-770a-11eb-39a3-519dc3531d0e
md" 
### Ejercicio 2 Ley de Torricelli
"

# ╔═╡ 609b721e-770a-11eb-38ce-35e3eef818aa
begin 
	d = 0.5
	D = 7
	g = 9.8 
	a = (π * d^2)/4 # Ojo las unidades 
	A = (π * D^2)/4 # Ojo las unidades
	h₀= 25 #en metros
	t = collect(0:20:180000)
	h(t) = (√h₀ - a/A * √(g*t/2))^2
	y = h.(t)
	plot(t,h)
	ylabel!("Altura h")
	xlabel!("tiempo t")
end

# ╔═╡ 5a0bb118-770d-11eb-0beb-f72812a173cd


# ╔═╡ eca1e0ae-770a-11eb-174d-ddecb104388f
tvacio = ((√h₀ * A/a)^2)*2/g  

# ╔═╡ 3902ecd6-770b-11eb-13f7-5315a3438a01
velocidad_instantanea=ForwardDiff.derivative(h, 300)

# ╔═╡ b3d33108-770b-11eb-2d14-4d2a463d2111
begin
	incremento = [1,5,10,25,50]
	velocidad_media_lim(incremento) = (h(300+incremento) - h(300))/incremento
	scatter(incremento,velocidad_media_lim)
	ylabel!("velocidad promedio")
	xlabel!("h")
end

# ╔═╡ a97d2874-770c-11eb-175c-1f7d2fd6d506


# ╔═╡ c59cea82-770d-11eb-290c-29ef2b2f391c
md" 
Nos da que la velocidad promedio es muy,muy,pero muuy chica posta
¿Pero si pensamos que la velocidad promedio se muede ver como , tiene sentido?
Bueno... en realidad tiene sentido pero al tener un tante que esas dimensiones el tiempo de vaciado es muy grande. Veamos que pasa si graficamos de nuevo la altura de vaciado en funcion del tiempo pero viendo haciendo zoom entre 0 y 300 segundos:

"

# ╔═╡ 5270ec2e-770e-11eb-30a5-b1e947b653fc
begin
	plot(t,h)
	xlims!(0,300)
	ylabel!("Altura h")
	xlabel!("tiempo t")
end

# ╔═╡ 736aa47e-770e-11eb-3dea-d12f2bd52514
md"
Ahora si, esto tiene más sentido del mundo, si pensamos vemos a la velocidad promedio como la pendiente de la recta secante entre dos puntos, en este caso $300 + 1,5,10,25\  y\ 50\  \text{segundos}$ nos vamos a dar cuenta que la misma es casi cero
"

# ╔═╡ 46081ba0-770f-11eb-00e0-33647b1babea
@bind h1 NumberField(0:5:50, default=1)

# ╔═╡ 1477a3b2-770f-11eb-1ea6-4727cc63272f
begin
	t₀=300
	velocidad_promedio = (h(t₀+h1) - h(t₀))/h1 # La pendiente de la secante
	plot(h,0:400,lab="funcion")
	plot!(t, h(t₀) .+ velocidad_instantanea*(t .- t₀), color=:orange,lab="recta tangente =$velocidad_instantanea") #Grafico la recta tangente en el punto c
	scatter!([t₀,t₀+h1], [h(t₀), h(t₀+h1)], color=:orange, markersize=3,lab="")
	plot!(t, h(t₀) .+ velocidad_promedio*(t .- t₀), color=:black,lab="recta secante=$velocidad_promedio")
	plot!([t₀, t₀+h1, t₀+h1], [h(t₀), h(t₀), h(t₀+h1)], color=:gray30,lab="")
	xlims!(0,400)
	ylims!(20,25)
end


# ╔═╡ Cell order:
# ╠═5c83de46-770a-11eb-0e81-db961793fb2e
# ╠═4ffe10c4-770f-11eb-223d-5d8efc8942e9
# ╠═8248198c-770b-11eb-2e1e-eba2a0135144
# ╠═a59e1984-770a-11eb-131c-6f2a0eb87e49
# ╟─c62a7ca6-770a-11eb-39a3-519dc3531d0e
# ╠═609b721e-770a-11eb-38ce-35e3eef818aa
# ╠═5a0bb118-770d-11eb-0beb-f72812a173cd
# ╠═eca1e0ae-770a-11eb-174d-ddecb104388f
# ╠═3902ecd6-770b-11eb-13f7-5315a3438a01
# ╠═b3d33108-770b-11eb-2d14-4d2a463d2111
# ╠═a97d2874-770c-11eb-175c-1f7d2fd6d506
# ╟─c59cea82-770d-11eb-290c-29ef2b2f391c
# ╠═5270ec2e-770e-11eb-30a5-b1e947b653fc
# ╟─736aa47e-770e-11eb-3dea-d12f2bd52514
# ╠═46081ba0-770f-11eb-00e0-33647b1babea
# ╠═1477a3b2-770f-11eb-1ea6-4727cc63272f
