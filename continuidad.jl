### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ a3658046-3725-11eb-1bb6-e981ac1de371
using Plots

# ╔═╡ 80448600-3763-11eb-0426-071d4c5c2581
using PlutoUI

# ╔═╡ b5ea471a-3725-11eb-09de-eb08414cea0c
plotly()

# ╔═╡ a88df786-376d-11eb-30bf-d36644f2462d
md" ## Continuidad y derivabilidad de funciones "

# ╔═╡ 6783a4fc-376d-11eb-32c9-c16376782b06
Lovell = "https://i.pinimg.com/originals/a5/15/1a/a5151af368347d2dea5e6fa2d1f34f65.jpg"


# ╔═╡ 920d6d1e-376d-11eb-169d-b7ba0fc2f787
Resource(Lovell)

# ╔═╡ d9c11a08-3fa0-11eb-1390-4b6ff5f9821d
md"El Capitán James Lovell y su transferencia fálica, digo, una maqueta de la nave Gemini 12"

# ╔═╡ b02439b8-3756-11eb-08fc-a1ab31ae4b9e
md"
### Un viaje a la luna 

Vamos está vez a ser más ambiciosos, y pensar en viajar ya no a Mar del Plata, a $400 km$ de Buenos Aires, sino a la Luna, a $384.000 km$ de la Tierra. Este viaje lo emprendarán tres capitanes: Kirk, Solo y Lovell.

El Capitán Kirk tiene de su lado al Ingeniero Scotty, que puede teletransportarlo instantáneamente de la Tierra a la Luna, siempre que el Capitán diga \"Beam me up, Scotty\" y la trama lo permita.

El Capitán Solo acompañado de Chewbacca, puede hacer que su Halcón Milenario empiece a ir instantáneamente a la velocidad deseada. Su frase de cabecera en estos casos es \"Punch it, Chewie!\".

El Capitán Lovell, lamentablemente, está atado a las molestas leyes de la física. Por eso su frase más memorable es \"Houston, we have a problem\". Su nave puede acelerar a razón de $10 m/s^2$, aproximadamente la aceleración de la gravedad (más que eso por tiempos prolongados pondría en riesgo su físico).

Vamos a graficar la posición de los tres capitanes como función del tiempo, y llamaremos $k(t)$ a la posición de Kirk, $h(t)$ a la posición de Han Solo, y $j(t)$ a la posición de Jim Lovell."

# ╔═╡ d711697a-3fcd-11eb-229e-6346b4134045
begin 
function k(x)
    if x > 0 
        384000
    else
        0 
    end  
end
function h(x)
    if x > 0 && x<3.84
        x*100000
    elseif x < 0
        0
	else
		384000
    end  
end
function j(x)
    if x > 0
        x*x*36*3600
    else
        0
    end  
end
x = collect(-1:0.0001:4)
plot(x,k,lab="Kirk")
plot!(x,h,lab="Han Solo")
plot!(x,j,lab="Jim Lovell")
#plot(x1,x1.*100000,lab="Han Solo: 100.000km/h")  
#plot!(x1,x1.*x1.*36*3600,lab="Jim Lovell: g") 
#plot!([384000], seriestype="hline", lab="Kirk")
#plot!([0], seriestype="hline", lab="Tierra", linestyle=:dot)

ylims!(0,400000)
end

# ╔═╡ 0bbab030-37e9-11eb-2d59-750dcc1389ed
md" ## Continuidad"

# ╔═╡ 669fff32-37e9-11eb-0a8f-b9965e7fc876
md" Cuando vimos funciones lineales, nuestro ejemplo era un viaje de Buenos Aires a Mar del Plata. Definimos entonces un tiempo de partida, un lugar de partida y una velocidad (pendiente), y a partir de eso generábamos una recta que pasaba por el punto de partida a la hora de partida, pero que se extendia infinitamente hacia atrás en el tiempo, como si hubieramos estado andando desde siempre, y nunca nos detuvieramos una vez llegado al destino.

En este caso vamos a definir la función de manera un poco mas realista: todas las naves están quietas en la posición $0$ (Tierra) para $t<0$. Tanto Kirk como Han Solo van a detenerse una vez que lleguen a la Luna, pero Jim Lowell, como dijimos, está a merced de las leyes de la física, con lo que va a seguir acelerando después de pasar la Luna.

Entonces definimos las funciones de la siguiente manera:

$k(t) = 0  \forall   t < 0$
$k(t) = 384.000 km \forall  t >0$

$h(t) = 0 \forall   t < 0$
$h(t) = 100.000 km/h t \forall   0 < t < 3,84$
$h(t) = 384.000 km \forall   t > 3,84$

$j(t) = 0 \forall   t < 0$
$j(t) = 129.600 km/h^2 t^2 \forall   t < 0$.

"


# ╔═╡ dd7f683a-3fd3-11eb-1063-f77c263be864
md"
Kirk, como dijimos, instantaneamente pasa de estar en la Tierra a estar en la Luna. Esto implica que nuestra función posición vale $f(t) = 0$ para $t<0$, y $f(t) = 384.000$ para $t>0$.

En casos como este decimos que la función no es continua en $t=0$, porque si yo me acerco en el tiempo hasta $t=0$ desde tiempos anteriores, o la \"izquierda\" del gráfico, la posición siempre será exactamente cero, mientras que si me acerco al tiempo cero desde tiempos posteriores, la posición siempre será exactamente $384.000 km$

Formalmente, esto se define de la siguiente manera:

$f(t)$es continua en $t = t_0$ si y solo si

$lim_{t \rightarrow t_0^+} f(t) = f(t_0)$ y

$lim_{t \rightarrow t_0^-} f(t) = f(t_0)$

Esto se lee como: la función $f(t)$ es continua en $t = t_0$ si y solo si el limite de $f(t)$ cuando $t$ tiende a $t_0$ desde la derecha es igual al valor de la función en $t_0$, y el límite de $f(t)$ cuando $t$ tiende a $t_0$ desde la izquierda también es igual al valor de la función en $t_0$.

Ya sea que tomemos la definición formal o la más coloquial, está claro que la función que nos define la posición de Kirk en el tiempo no es continua, dado que en $t=0$ pasa de un valor 0 a un valor $384.000km$ instantaneamente."

# ╔═╡ a54b80a2-37ef-11eb-1561-ff2eb53d96ff
md"

Pero que pasa con la función posición de Han Solo? En $t=0$, tanto por \"izquierda\" como por \"derecha\", el límite de $h(t)$ con $t$ tendiendo a $0$ es $0$, o sea que la función es continua en $t=0$, y si bien no lo demostraremos ahora, es continua en todos sus puntos.

"
#Acá seguimos con que h(t) es continua pero no derivable, y j(t) es continua y derivable.

# ╔═╡ 4f55c706-3822-11eb-0f7e-4d682f126069


# ╔═╡ Cell order:
# ╠═a3658046-3725-11eb-1bb6-e981ac1de371
# ╠═80448600-3763-11eb-0426-071d4c5c2581
# ╠═b5ea471a-3725-11eb-09de-eb08414cea0c
# ╠═a88df786-376d-11eb-30bf-d36644f2462d
# ╠═6783a4fc-376d-11eb-32c9-c16376782b06
# ╠═920d6d1e-376d-11eb-169d-b7ba0fc2f787
# ╠═d9c11a08-3fa0-11eb-1390-4b6ff5f9821d
# ╠═b02439b8-3756-11eb-08fc-a1ab31ae4b9e
# ╠═d711697a-3fcd-11eb-229e-6346b4134045
# ╠═0bbab030-37e9-11eb-2d59-750dcc1389ed
# ╠═669fff32-37e9-11eb-0a8f-b9965e7fc876
# ╠═dd7f683a-3fd3-11eb-1063-f77c263be864
# ╠═a54b80a2-37ef-11eb-1561-ff2eb53d96ff
# ╠═4f55c706-3822-11eb-0f7e-4d682f126069
