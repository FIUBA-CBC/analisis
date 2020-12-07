### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ fd52b8ec-2dcc-11eb-2779-475a684dceaa
using Plots

# ╔═╡ 6d7d911a-2dd1-11eb-1196-7920331122e4
using LaTeXStrings

# ╔═╡ 41e29e6a-2dd1-11eb-1b5a-51afb8d50271
begin
	using Distributions
	using StatsPlots
end

# ╔═╡ e15c55a8-2dcc-11eb-30bf-f976f1333c2b
md"## Algunas funciones y funcionalidades"

# ╔═╡ 1a0dd7f0-2dcd-11eb-38a0-71e3827456e7
x = 0:0.1:20

# ╔═╡ 1ddae090-2dd1-11eb-231e-775d93057350
plot(x, x.*2 .+ 1) 

# ╔═╡ 7ce6b3d8-2dcd-11eb-0a92-2f1a2d1009a6
plot(x , x.^2, legend=false)

# ╔═╡ 99758d94-2dcd-11eb-3c4e-4b113547ae1e
plot(x, exp.(x))

# ╔═╡ e29328fe-2dcf-11eb-150f-2d70019c5bf2
plot(x, exp.(x), yscale=:log, title="Exponencial con y en escala logaritmica")

# ╔═╡ 3aa2b7fa-2dce-11eb-2ef6-45386b60d649
plot(x, log.(x), label="log(x)")

# ╔═╡ 27a0cc9c-2dcd-11eb-235e-63a8ba2f5565
plot(x, sin.(x), label="sin(x)")

# ╔═╡ 4b1f0102-2dcd-11eb-0d44-93efeba53079
plot(x, cos.(x), label="cos(x)")

# ╔═╡ 5ad23182-2dcd-11eb-035b-c78d11ea60ad
begin
	plot(x, sin.(x), label="sin(x)")
	plot!(x, cos.(x), label="cos(x)")
end

# ╔═╡ a0f55998-2dd0-11eb-2b06-095e29c33ced
plot(x, sin.(x) + cos.(x))

# ╔═╡ 742aea4e-2dd1-11eb-23a7-0d5ca34009fd
seno = latexstring("\\ (sin(x))^{2}")

# ╔═╡ cb9e785a-2dd0-11eb-293c-cf25b76b5511
begin
	plot(x, (sin.(x)).^2, label=seno)
	plot!(x, sin.(x), label="sin(x)")
end

# ╔═╡ c414d330-2dd1-11eb-0836-d55728aac934
plot(Normal(), xlim=(-10,10), label="Normal(0,1)")

# ╔═╡ f63c9ab4-2dd1-11eb-2a68-37a27fbc2d6e
plot(Exponential())

# ╔═╡ ff83717e-2dd1-11eb-1956-9f5ac34ca563
plot(Gamma(10,10))

# ╔═╡ Cell order:
# ╠═e15c55a8-2dcc-11eb-30bf-f976f1333c2b
# ╠═fd52b8ec-2dcc-11eb-2779-475a684dceaa
# ╠═1a0dd7f0-2dcd-11eb-38a0-71e3827456e7
# ╠═1ddae090-2dd1-11eb-231e-775d93057350
# ╠═7ce6b3d8-2dcd-11eb-0a92-2f1a2d1009a6
# ╠═99758d94-2dcd-11eb-3c4e-4b113547ae1e
# ╠═e29328fe-2dcf-11eb-150f-2d70019c5bf2
# ╠═3aa2b7fa-2dce-11eb-2ef6-45386b60d649
# ╠═27a0cc9c-2dcd-11eb-235e-63a8ba2f5565
# ╠═4b1f0102-2dcd-11eb-0d44-93efeba53079
# ╠═5ad23182-2dcd-11eb-035b-c78d11ea60ad
# ╠═a0f55998-2dd0-11eb-2b06-095e29c33ced
# ╠═6d7d911a-2dd1-11eb-1196-7920331122e4
# ╠═742aea4e-2dd1-11eb-23a7-0d5ca34009fd
# ╠═cb9e785a-2dd0-11eb-293c-cf25b76b5511
# ╠═41e29e6a-2dd1-11eb-1b5a-51afb8d50271
# ╠═c414d330-2dd1-11eb-0836-d55728aac934
# ╠═f63c9ab4-2dd1-11eb-2a68-37a27fbc2d6e
# ╠═ff83717e-2dd1-11eb-1956-9f5ac34ca563
