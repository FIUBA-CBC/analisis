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

# ╔═╡ a0199626-6faf-11eb-3208-ed3b6cc4d835
using Pluto

# ╔═╡ ad7545c4-640e-11eb-1939-b1951d89c24c
using Plots

# ╔═╡ caeaa286-640e-11eb-0e70-5ba4322a021b
using PlutoUI

# ╔═╡ 77698f2a-69aa-11eb-1d85-4f74a52bc9a8
plotly()

# ╔═╡ d04eacca-640e-11eb-37f7-65e31bcafddf
md"
# Sucesiones
"


# ╔═╡ 19d941d4-640f-11eb-322d-43c8c17e1ca5
md"Una **sucesion** se puede pensar como una lista de numeros escrita en un orden definido:

 $a_1, a_2, a_3, ..., a_n$

El número $a_1$ se llama *primer termino*, $a_2$ es el *segundo termino* y de forma general $a_n$ es el *n-esimo termino*. La notacion estándar es $(a_n)_{n\in\mathbb{N}}$

Para cada número entero positivo $n$ existe un numero $a_n$ por lo que podemos definir a una sucesion como una funcion que toma números enteros positivos, es decir que su dominio es $\mathbb{N}$ y su codominio son los reales $\mathbb{R}$

Una sucesion es una funcion $a: \mathbb{N}\rightarrow \mathbb{R}$, que se escribe $a(n)=a_n$.


"

# ╔═╡ 7d6e156a-640f-11eb-03ff-9bf78a886890
md"
Veamos un ejemplo de sucesion: 
 sea la sucesion $a_n = \frac{3^{^{n-3}}}{n^{2}}$
 
 El primer término se obtiene reemplazando en la fórmula $a_n$, la variable $n$ por el valor ${\color{Red} n}{\color{Red} =}{\color{Red} 1}$
 
$a_{\color{Red} 1}=\frac{3^{^{{\color{Red} 1}-3}}}{{\color{Red} 1}^{2}}=3^{-2}=\frac{1}{9}$
 
 Los siguientes términos se obtienen reemplazando la variable $n$ por lo valores $2, 3, 4$ y $5$ respectivamente.
 
$a_{\color{Red} 2}=\frac{3^{^{{\color{Red} 2}-3}}}{{\color{Red} 2}^{2}}=\frac{3^{-1}}{4}=\frac{1}{12}$

$a_{\color{Red} 3}=\frac{3^{^{{\color{Red} 3}-3}}}{{\color{Red} 3}^{2}}=\frac{3^{0}}{9}=\frac{1}{9}$


$a_{\color{Red} 4}=\frac{3^{^{{\color{Red} 4}-3}}}{{\color{Red} 4}^{2}}=\frac{3}{16}$

$a_{\color{Red} 5}=\frac{3^{^{{\color{Red} 5}-3}}}{{\color{Red} 5}^{2}}=\frac{3^{2}}{25}=\frac{9}{25}$

De la misma forma, se obtiene el décimo término de la sucesión evaluando su fórmula con el valor ${\color{Red} n}{\color{Red} =}{\color{Red} 1}{\color{Red} 0}$

$a_{{\color{Red} 1}{\color{Red} 0}}=\frac{3^{{\color{Red} 1}{\color{Red} 0}-3}}{{{\color{Red} 1}{\color{Red} 0}}^{2}}=\frac{3^{7}}{100}=21,87$
"

# ╔═╡ a72c4d38-6414-11eb-0323-2b101a96a4e2
md"

 #### Límite
 

 
  Una sucesion ${a_n}$ tiene límite L si podemos hacer que los terminos de $a_n$  se aproximen a L tanto como se quiera tomando un $n$ lo suficientemente grande. Esto se escribe:
  
 $\lim_{n\rightarrow \infty} a_n = L$ o $a_n\rightarrow L$ cuando $n:n\rightarrow \infty$
 
 Esto se lee \"El límite de a sub n cuando n tiende a infinito es L\"
 
 Si el límite $\lim_{n\rightarrow \infty} a_n = L$ existe se dice que la sucesión **converge** y de lo contrario **diverge**.
 
 En los siguientes gráficos se observa un ejemplo de cada una.

Primero tenemos la sucesión $a_n=\frac{1}{n}$, la cual converge a $0$, ya que a medida que n es mayor el resultado de la sucesión es mas pequeño (tiende a cero). Luego tenemos a la sucesión $b_n=n^{2}$, la cual diverge, ya que a medida que aumenta n, la sucesión toma valores más y más grandes, es decir, tiende a infinito.
 
(hacer dos graficos ,uno al lado del otro)
 
"


# ╔═╡ bc25a3bc-714b-11eb-19db-6b45c6ff60e0
begin
	terminos0=100
	lim0 = zeros(terminos0)
	n0 = collect(1:1:terminos0)
	for i = 1:terminos0
		lim0[i] = n0[i] * (n0[i])
		
	end
	limite0= lim0[terminos0]
	scatter(n0,lim0, label="bn")
	plot!([1], seriestype="hline", lab="",color=:black)
	
	title!("Sucesión Divergente")
	xlabel!("n")
	ylabel!("bn")
end

# ╔═╡ a9439dbc-714b-11eb-0b3f-954322529980
md"
Una version un poco más precisa es la siguiente:
Una sucesion ${a_n}$ tiene el limite $L$

$\lim_{n\rightarrow \infty} a_n = L$ o bien $a_n\rightarrow L$ cuando $n:n\rightarrow \infty$

si para todo $\varepsilon>0$ hay un correspondiente entero $N$ tal que 
si $n>N$ entonces $\left |a_n -L  \right | < \varepsilon$

Por ahi esta deficinion no es del todo clara asi que hagamos un grafico para ver de que se trata
"

# ╔═╡ 88319290-6415-11eb-291c-79d1bf8ccd7b
md"
Agregá la cantidad de terminos para ver como evoluciona la sucesion.
"



# ╔═╡ 28002902-6415-11eb-3ec5-2ff429ee4125
@bind terminos NumberField(1:200, default=1)

# ╔═╡ 2f82e7f8-69af-11eb-283c-ebaba2ca091c
begin
ϵ_b = @bind ϵ Slider(0.03:0.001:0.0500,show_value=true)
md"ϵ: $ϵ_b"
end

# ╔═╡ 4827edf6-714d-11eb-1176-1d4368d4a161
begin
	terminos00=100
	lim00 = zeros(terminos00)
	n00 = collect(1:1:terminos00)
	for i = 1:terminos00
		lim00[i] = 1/n0[i]
		
	end
	limite00= lim00[terminos00]
	scatter(n00,lim00, label="an")
	plot!([0], seriestype="hline", lab="",color=:black)
	plot!([0+ϵ], seriestype="hline", lab="",color=:grey)
	plot!([0-ϵ], seriestype="hline", lab="",color=:grey)
	title!("Sucesión Convergente")
	xlabel!("n")
	ylabel!("an")
end

# ╔═╡ 1972b17a-6415-11eb-3a05-a76e20b37ce5
begin
	lim1 = zeros(terminos)
	n1 = collect(1:1:terminos)
	for i = 1:terminos
		lim1[i] = n1[i] / (n1[i] + 1)
		
	end
	limite1= lim1[terminos]
	scatter(n1,lim1, label="an=$limite1")
	plot!([1], seriestype="hline", lab="",color=:black)
	plot!([1+ϵ], seriestype="hline", lab="",color=:grey)
	plot!([1-ϵ], seriestype="hline", lab="",color=:grey)
	title!("")
	xlabel!("n")
	ylabel!("an")
end

# ╔═╡ 8e4e197c-69a5-11eb-0e01-357faf0814f9
 md"
La diferencia entre el valor al que converge la serie y el valor $a_n$ es $(1- limite1) con $terminos terminos
"

# ╔═╡ 6a6de6f6-69ad-11eb-3bc4-1f2622111a13
md" 

##### Veamos otras sucesiones y su comportamiento "

# ╔═╡ 4b243270-69b0-11eb-0f1d-e34a13c86159
md"
Veamos como se comporta la sucesion:

$\frac{ln(n)}{n}$
"

# ╔═╡ df33be38-6cab-11eb-1bc5-4d1f573ec5a2
@bind terminos2 NumberField(1:200, default=1)

# ╔═╡ beba74a8-6cab-11eb-3e8a-81bf71d64a6c
begin
	lim2 = zeros(terminos2)
	n2 = collect(1:1:terminos2)
	for i = 1:terminos2
		lim2[i] = log(n2[i])/n2[i]
	end
	limite2= lim2[terminos2]
	scatter(n2,lim2,lab="an=$limite2")
	title!("")
	xlabel!("n")
	ylabel!("an")

end

# ╔═╡ 78c0541c-6cb4-11eb-292f-9bb43d2c7c36
md"
Veamos como se comporta la sucesion:

$$(-1)^n$$
"

# ╔═╡ 167880f2-6cae-11eb-10f9-695e95bea9dd
@bind terminos3 NumberField(1:200, default=1)

# ╔═╡ 1741635c-6cae-11eb-323c-dd7ff6ffa50e
begin
	lim3 = zeros(terminos3)
	n3 = collect(1:1:terminos3)
	for i = 1:terminos3
		lim3[i] =  (-1)^(n3[i])
	end
	limite3= lim3[terminos3]
	scatter(n3,lim3,lab="an=$limite3")
	title!("")
	xlabel!("n")
	ylabel!("an")

end

# ╔═╡ 8fe6fddc-6cb4-11eb-344d-8d6687205f74
md" Podemos observar que oscila entre $-1$ y $1$. ¿Qué pasará si la dividimos por $n$?
Es decir:

$\frac{(-1)^n}{n}$
"

# ╔═╡ 76273888-6cb4-11eb-112d-91a3ed30a042
@bind terminos4 NumberField(1:200, default=1)

# ╔═╡ d89b27d6-6cb4-11eb-0dd6-97376d57740c
begin
	lim4 = zeros(terminos4)
	n4 = collect(1:1:terminos4)
	for i = 1:terminos4
		lim4[i] =  ((-1)^(n4[i]))/n4[i]
	end
	limite4= lim4[terminos4]
	scatter(n4,lim4,lab="an=$limite4")
	title!("")
	xlabel!("n")
	ylabel!("an")

end

# ╔═╡ 15f406b4-6417-11eb-1614-577cdf0f282c
md"
#### Álgebra de limites

Si {$a_n$} y {$b_n$} son sucesiones convergentes y $c$ es una constante, entonces

$\lim_{n\rightarrow \infty} (a_n + b_n) =\lim_{n\rightarrow \infty} a_n + \lim_{n\rightarrow \infty} b_n$

$\lim_{n\rightarrow \infty} (a_n - b_n) =\lim_{n\rightarrow \infty} a_n - \lim_{n\rightarrow \infty} b_n$

$\lim_{n\rightarrow \infty} ca_n =c \lim_{n\rightarrow \infty} a_n$	
$\lim_{n\rightarrow \infty} c = c$

$\lim_{n\rightarrow \infty} (a_n\cdot b_n) = \lim_{n\rightarrow \infty} a_n \cdot  \lim_{n\rightarrow \infty} b_n$

$\lim_{n\rightarrow \infty} \frac{a_n}{b_n}=\frac{\lim_{n\rightarrow \infty} a_n}{\lim_{n\rightarrow \infty} b_n}$ si $\ lim_{n\rightarrow \infty} b_n\neq 0$

$\lim_{n\rightarrow \infty} a_{n}^{p}=[\lim_{n\rightarrow \infty} a_n]^p$ si $p>0$ y $a_n>0$




"

# ╔═╡ 726a445c-641d-11eb-32eb-75df861e1b54
md"
#### Propiedad del Sandwich

Si dos sucesiones convergen a un mismo límite $L$, entonces cualquier sucesión comprendida entre ambas, también converge a $L$.


Si a partir de cierto $n_0\in\mathbb{N}$ vale que $b_n \leq a_n \leq c_n$, entonces se tiene


$\lim_{n\rightarrow \infty} b_n\leq \lim_{n\rightarrow \infty} a_n\leq \lim_{n\rightarrow \infty} c_n$

 

 **Ejemplo:** Calcular el $\lim_{n\rightarrow \infty} \frac{cos(n)}{\sqrt{n}}$

El coseno es una función que toma valores entre $-1$ y $1$. Entonces vale

$-1\leq cos(n)\leq 1$
multiplico cada término por $\frac{1}{\sqrt{n}}$:

$\frac{-1}{\sqrt{n}}\leq \frac{cos(n)}{\sqrt{n}}\leq \frac{1}{\sqrt{n}}$

Ahora bien: $\lim_{n\rightarrow \infty}\frac{-1}{\sqrt{n}} = \lim_{n\rightarrow \infty}\frac{1}{\sqrt{n}}=0$

$0 \leq \lim_{n\rightarrow \infty} \frac{cos(n)}{\sqrt{n}} \leq 0$

Por lo tanto la única solución es $\lim_{n\rightarrow \infty} \frac{cos(n)}{\sqrt{n}}=0$

Veamoslo en un gráfico interactivo donde podemos elegir la cantidad de terminos $n$ a utilizar
"


# ╔═╡ 94acde12-641d-11eb-1d7e-e369279bc92a
@bind terms NumberField(1:1000, default=1)

# ╔═╡ dd5edda6-641d-11eb-0b53-9f486da7fae7
begin
	lim7=zeros(terms)
	lim8=zeros(terms)
	lim9=zeros(terms)
	n5=collect(1:1:terms)
	
	for i=1:terms
		lim7[i]=1/√(n5[i])
		lim8[i]=cos(n5[i])/√(n5[i])
		lim9[i]=-1/√(n5[i])
		
		
	end
	limite7 = lim7[terms]
	limite8 = lim8[terms]
	limite9 = lim9[terms]

	scatter(n5,lim7, label="an = $limite7")
	scatter!(n5,lim8, label="bn = $limite8")
	scatter!(n5,lim9, label="cn = $limite9")
	
end

# ╔═╡ 33c3b41a-6425-11eb-05ef-21b215f827ad
md"##### Sándwich en el infinito
 La propiedad del sándwich se puede generalizar de la siguiente forma.



Si a partir de cierto $n_0\in\mathbb{N}$ vale que  $a_n > b_n$ y $b_n \rightarrow +∞$ entonces se tiene que $a_n \rightarrow +∞$ 

**Ejemplo:** Calcular el $\lim_{n\rightarrow ∞} a_n$ sabiendo que $a_n > \frac{3n^{2}+1}{100n + 5}$ para todo $n.$

Calculamos el $\lim_{n\rightarrow ∞} \frac{3n^{2}+1}{100n + 5}.$ Para ello dividimos por $n$ al numerador y denominador:

$\lim_{n\rightarrow ∞} \frac{3n^{2}+1}{100n + 5} = $\lim_{n\rightarrow ∞} \frac{3n+ \frac{1}{n}}{100 + \frac{5}{n}}=+∞$
Entonces:

$\lim_{n\rightarrow ∞} a_n = +∞$

Grafiquemos la sucesion para poder tener un mejor análisis

"

# ╔═╡ 57bb103e-69b1-11eb-0fd0-9f5902a6c8ea
@bind terminos5 NumberField(1:200, default=1)

# ╔═╡ 6d816262-6cb6-11eb-1513-1b065fa019c6
begin
	lim5 = zeros(terminos5)
	n55 = collect(1:1:terminos5)
	for i = 1:terminos5
		lim5[i] =  ((3*(n55[i])^2) + 1)/(100n55[i] + 5)
	end
	limite5= lim5[terminos5]
	scatter(n55,lim5,lab="an=$limite5")
	title!("")
	xlabel!("n")
	ylabel!("an")

end

# ╔═╡ 472062e2-6425-11eb-38d7-e764c0ccfc0a
md"
#### Sucesiones monótonas 

Las sucesiones son funciones que tienen por dominio a los números naturales. Estudiaremos aquellas sucesiones que son funciones crecientes o decrecientes de sus variable natural.
Es decir:

$a_{n+1}\leq a_n$ para (casi) todo $n$. En tal caso será **decreciente** . La literatura las llama tambien **no crecientes** 

Si la desigualdad es estricta, la sucesion $a_n$ es estrictamente decreciente (a partir de cierto $n$) 


En el caso que $a_{n+1}\geq a_n$ para (casi) todo $n$.
 la sucesion será **creciente**. La litaretura tambien las llama **no decrecientes**
Si la desigualdad es estrictal la sucesion $a_n$ es estrictamente decreciente (a partir de cierto $n$)
En ambos casos decimos que se trata de una **sucesión monótona**.

La importancia de las sucesiones monótonas radica en que siempre tienen límite, ya sea éste finito o infinito. Antes de enunciar con precisión este resultado, hacemos una observación que será de utilidad en lo que sigue.

Si la sucesión es de términos positivos se tiene que:

$\frac{a_{n+1}}{a_n} \leq 1$ equivale a $a_n$ decreciente.

$\frac{a_{n+1}}{a_n} \geq 1$ equivale a $a_n$ creciente.



"

# ╔═╡ e529bb96-6425-11eb-04be-85ddcfcff418
md"
### Indeterminaciones

Supongamos que queremos calcular el siguiente límite:
$\lim_{n\rightarrow \infty }\frac{sen(\frac{2}{n}))}{\frac{1}{n}}$

Si sustituimos $n$ por $\infty$ tenemos:

$\lim_{n\rightarrow \infty }\frac{sen(\frac{2}{n}))}{\frac{1}{n}}=\frac{sen(0)}{0}=\frac{0}{0}$

Obviamente, este resultado no tiene sentido matemáticamente.

Algo parecido ocurre en este límite:
$\lim_{n\rightarrow \infty }\frac{2}{\frac{1}{n}}=\frac{2}{0}=\infty$

Sin embargo, hay una diferencia sustancial entre ambos resultados: podemos asegurar el resultado de todos los límites en los que aparece $1/0$ es $∞$, pero no podemos predecir el resultado de los límites en los que aparece $0/0$.



Una **indeterminación** matemática es una expresión algebraica que aparece en el cálculo de los límites y cuyo resultado no se puede predecir.

Cuando aparece una indeterminación en un límite, el límite **depende de la propia función**. Esto conlleva que, aunque aparezca la misma indeterminación, el límite puede ser distinto para funciones distintas.

Entonces es necesario, en cada caso, aplicar alguna técnica algebraica que permita \"salvar\" la indeterminación y calcular el límite. $0/0$ no es el único tipo de indeterminación con el que nos vamos a encontrar.

Por ejemplo, el producto de dos sucesiones, una de ellas que tienda a cero y la otra que tienda a infinito(\"cero por infinito\" o \"$0\cdot \infty$\"), constituye también una indeterminación. Analicemos los siguientes ejemplos:


$$a_n=\frac{1}{n}\rightarrow 0, b_n=n\rightarrow \infty\Rightarrow 
 a_n\cdot b_n=\frac{1}{n}\cdot n\rightarrow 1$$

$$a_n=\frac{1}{n}\rightarrow 0,b_n=n^{2}\rightarrow \infty\Rightarrow   a_n\cdot b_n=\frac{1}{n}\cdot n^{2}\rightarrow \infty$$

$$a_n=\frac{1}{n^{2}}\rightarrow 0,b_n=n\rightarrow \infty\Rightarrow  a_n\cdot b_n=\frac{1}{n^{2}}\cdot n=\frac{1}{n}\rightarrow 0$$

En estos observamos que no existe una propiedad que pueda predecir sobre un límite del tipo \"$0\cdot \infty$\".

Los límites de los siguientes \"tipos\", aunque no son todos, constituyen indeterminaciones



$\frac{\infty}{\infty}$

$0\cdot \infty$

$\infty ^{0}$

$+\infty -\infty$

$\frac{0}{0}$

$$0^{0}$$





En todos los casos, hay que entender estos simbolos como el límite de la operación aritmética indicada en cada caso, entre dos sucesiones.

Como vimos, el álgebra de límites requiere que las sucesiones involucradas sean convergentes a un número real. Cuando esto no ocurre, a veces se presentan *indeterminaciones*. En cada caso hay que usar algún recurso algebraico que permita salvar la indeterminación y calcular el valor del límite.

"

# ╔═╡ f9a3ca2c-7153-11eb-0408-1f0916e2d550
md"
**Ejemplo:** Calcular el $\lim_{n\rightarrow \infty} \sqrt{n}(\sqrt{n+5}-\sqrt{n})$

En este caso no se puede aplicar el álgebra de límites, porque de un primer análisis surge $\sqrt{n}\rightarrow +\infty$ y $(\sqrt{n+5}-\sqrt{n}$ es de la forma \"infinito menos infinito\" que constituye una indeterminación en si misma.

Para salvar la indeterminación y poder calcular el límite, multiplicaremos por el conjugado de $(\sqrt{n+5}-\sqrt{n}$:

$\sqrt{n}(\sqrt{n+5}-\sqrt{n})= \sqrt{n}(\sqrt{n+5}-\sqrt{n}) \frac{\sqrt{n+5}+\sqrt{n}}{\sqrt{n+5}-\sqrt{n}}$

*El producto por conjugado*:
Cuando aparecen raices cuadradas es útil usar la siguiente identidad para eliminarlas
$(A-B)(A+B)=A^{2}-B^{2}$

Entonces:
$(\sqrt{n+5}-\sqrt{n})(\sqrt{n+5}+\sqrt{n})=(n+5-n)=5$

$\sqrt{n}(\sqrt{n+5}-\sqrt{n}) \frac{\sqrt{n+5}+\sqrt{n}}{\sqrt{n+5}-\sqrt{n}}=\frac{5\sqrt{n}}{\sqrt{n+5}-\sqrt{n}}$

Seguimos teniendo una indeterminación ya que el númerador tiende a más infinito y el denominador también. Pero estamos mejor que antes. Sacamos factor común $\sqrt{n}$ en el denominador:

$\frac{5\sqrt{n}}{\sqrt{n+5}-\sqrt{n}}=\frac{5\sqrt{n}}{\sqrt{n}\left ( \sqrt{1+\frac{5}{n}}+1 \right )}=\frac{5}{\sqrt{1+\frac{5}{n}}+1}$

Ahora estamos en condiciones de aplicar el álgebra de límites: el numerador es igual a $5$ y la raiz del denominador tiende a $1$. Entonces:

$\lim_{n\rightarrow \infty }\sqrt{n}\left ( \sqrt{n+5}-\sqrt{n} \right)=\lim_{n\rightarrow \infty}\frac{5}{\sqrt{1+\frac{5}{n}}+1}=\frac{5}{2}$

"

# ╔═╡ 431abf4c-69b8-11eb-18e4-2f2c769a85a1
md"
#### Parecen pero NO
En ocasiones no es posible aplicar álgebra de límites porque los límites involucrados no son finitos, sin embargo no estamos ante una indeterminación. A continuación damos algunas situaciones donde se puede saber el límite a pesar de que los límites involucrados no sean todos números reales.

$$(+\infty)\cdot L= +\infty\ si\ L>0$$ 

Ejemplo: $\lim_{n\rightarrow \infty }\sqrt{n}(\frac{n}{3n+1})= +\infty$

$$(+\infty)+\infty=+\infty$$
Ejemplo: $\lim_{n\rightarrow \infty }\frac{n^{2}}{n+1}+\sqrt{n}=+\infty$

$$(+\infty) + oscila\ finitamente=+\infty$$ 
Ejemplo: $\lim_{n\rightarrow \infty }(n+cos(n))=+\infty$

$$\frac{0}{\infty}=0$$ 
Ejemplo: $\lim_{n\rightarrow \infty }\frac{\frac{1}{n}}{n^{2}+1}=0$

$$(0)^{+\infty }=0$$ 
Ejemplo: $\lim_{n\rightarrow \infty }(\frac{n}{n^{2}+1})^{n}=0$

Cada una de estas afirmaciones se puede demostrar a partir de la función de límite. Haremos uso de ellas libremente.

### \"Cero por acotado\"
Si bien los límites del tipo \"$0\cdot \infty$\" resulta ser una indeterminación y, por lo tanto, nada podemos decir sobre el valor del límite sin salvar tal indeterminación, si se puede decir algo cuando estamos en presencia de un producto de una sucesión que tiende a cero por otra que está acotada. En estos casos se obtiene una sucesión que tiende a cero. Es decir:

Si $a_n\rightarrow 0$ y $\left | b_n \right | \leq k$ entonces $a_n\cdot b_n\rightarrow 0$

**Ejemplo:** Calcular el $\lim_{n\rightarrow \infty }\left ( 1-\frac{n}{n+1} \right )(-1)^{n+1}$

La expresión $(-1)^{n+1}$ vale $1$ o $-1$ según la paridad de $n$. En particular está acotada: $\left | \left ( -1 \right )^{n+1} \right |\leq 1$. Por otra parte, $\lim_{n\rightarrow \infty }\left ( 1-\frac{n}{n+1} \right )=\lim_{n\rightarrow \infty }\left (\frac{n}{n+1} \right)=0$. Usando la propiedad \"cero por acotado\" se obtiene:


$$\lim_{n\rightarrow \infty }\left ( 1-\frac{n}{n+1} \right )(-1)^{n+1}=0$$



"

# ╔═╡ 9d424d10-642b-11eb-0800-ed0461bad325
md"##### Convergencia de sucesiones del tipo $ a_n= r^n$
La sucesión {$r^{n}$} es convergente si $-1 < r\leq 1$ y divergente para todos los otros valores de $r$.
$\lim_{n\rightarrow\infty} =\begin{cases}
 &  0 \text{ si -1< r< 1 }\\  
 & 1 \text{ si } r=1 
\end{cases}$
            
"

# ╔═╡ f3ff887a-642b-11eb-0fdd-b5c7db6ec8cd
begin
	terminos11=100
	lim10=zeros(terminos11)
	lim11=zeros(terminos11)
	lim12=zeros(terminos11)
	n6=collect(1:1:terminos11)
	
	for i=1:terminos11
		lim10[i]=1.01^n6[i]
		lim11[i]=1^(n6[i])
		lim12[i]=0.99^(n6[i])
		
		
	end
	
	limite10 = lim10[terminos11]
	limite11 = lim11[terminos11]
	limite12 = lim12[terminos11]
	
	scatter(n6,lim10, label="an=$limite10")
	scatter!(n6,lim11, label="bn=$limite11")
	scatter!(n6,lim12, label="cn=$limite12")
	ylims!(0.4,2)
	
	title!("")
	xlabel!("n")
	ylabel!("an, bn, cn")
end

# ╔═╡ ac6351b2-642c-11eb-2f61-ab08efb3c175
md"
### Sucesiones dadas en forma recurrente

Hasta ahora hemos tratado cada sucesión por medio de su término general.

Sin embargo, en muchas situaciones vinculadas con las aplicaciones y procesos iterativos, las sucesiones se presentan en forma recurrente. Esto es, se define el primer término $a_1$, luego del mismo surge $a_2$ y en general, se define $a_{n+1}$ a partir del término anterior $a_n$ o más generalmente a partir de todos los términos anteriores.

A estas sucesiones se las llama *sucesiones recurrentes* y requieren, muchas veces un tratamiento distinto al que le venimos dando a las sucesiones."



# ╔═╡ 031995ce-6a0f-11eb-29f9-599e9cfb8427
md"
###### Aplicacion:
Una sucesión que surge en ecología como un modelo para el crecimiento poblacional se define por
medio de la ecuación logística en diferencias que posee la siguiente forma:

$$p_{n+1} =k \cdot p_n (1-p_n)$$

Donde $p_n$ es el tamaño de una poblacion en la $n-ésima$ generacion. Este balor se encontrará entre $0$ y $1$, es decir $0 \leq  p_n \leqslant 1$


Supongamos que nos interesa predecir el tamaño de la poblacion a mediad que el tiempo avanza. ¿Podremos encontrar algun valor limite? ¿Existe un comportamiento cíclico? o ¿el comportamiento es similar siempre o pueden haber movimientos aleatorios?

Gracias a Julia podremos responder estas preguntas. 
Abajo tenemos dos *sliders*, con uno podemos hacer variar a la constante $k$ y con el otro vemos la cantidad de iteraciones, es decir las generaciones


1. Con un valor de poblacion inicial $p_0 = \frac{1}{2}$ y para dos valores de $k$ entre 1 y 3, vean que pasa con 30 términos.
2. Repetir el punto anterior pero modificando el valor inicial de la poblacion. Depende del valor de k el comportamiento?
3. Si variamos el valor de k entre 3 y 3.4 ¿Qué pasa? ¿Y si vale 3.5?
4. Para valores entre 3.6 y 4 ver que pasa. Lo que sucese es un fenómeno que se llama *caos* . Al final te dejamos un video por si te dió curiosidad.

"

# ╔═╡ dfaf8452-69bb-11eb-2204-eb4c3c503462

k = @bind ka Slider(0:0.1:4,show_value=true)



# ╔═╡ bc7447c8-69bf-11eb-2a5b-ad28e93001d4
iteraciones = @bind iter Slider(1:100,show_value=true)


# ╔═╡ 8127fa76-6cc5-11eb-0245-7d18ec64d88f
p0 = 0.5

# ╔═╡ d9d18096-69b9-11eb-0111-9b62d1dec03d
begin
	terminos111 =iter
	limrec = zeros(terminos111)
	nrec = collect(1:1:terminos111)
	for i = 1:iter-1
		
		limrec[1] = p0
		
		limrec[i+1] = ka*limrec[i]*(1-limrec[i])
		
	end
	
	poblacion=limrec[terminos111]
	
	scatter(nrec,limrec, label="pn=$poblacion")
	plot!(nrec,limrec, label="")
	
	title!("")
	xlabel!("Cantidad de términos ")
	ylabel!("Población pn")

	ylims!(0,1.1)
end

# ╔═╡ 235970d6-7149-11eb-216e-715f195832e5
md"
### Un *plus* de sucesiones

Si queres acá te dejamos un tutorial para que veas como se gráfica una sucesión.



`Hola world`
"


# ╔═╡ b24a61da-69b1-11eb-231c-c5d49a44f578
yoda = "https://media1.tenor.com/images/52987ea5d89a3700d96ca943a94c774d/tenor.gif?itemid=15689476";

# ╔═╡ cf82c80c-6cc5-11eb-2999-2ff8fb008686
md"
Preparate un té y empezá a flashear" 

# ╔═╡ d46fa5dc-69b3-11eb-3137-cbc9aa25ccd1
Resource(yoda)

# ╔═╡ 38d448a8-6cc6-11eb-2523-d15337e10e66
html"""

<div style="padding:56.25% 0 0 0;position:relative;"><iframe src="https://www.youtube.com/watch?v=EOvLhZPevm0" style="position:absolute;top:0;left:0;width:100%;height:100%;" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>

"""

# ╔═╡ 7b485b52-6cc6-11eb-3088-27d318c62764
# Este es el video https://www.youtube.com/watch?v=EOvLhZPevm0

# ╔═╡ Cell order:
# ╠═a0199626-6faf-11eb-3208-ed3b6cc4d835
# ╠═ad7545c4-640e-11eb-1939-b1951d89c24c
# ╠═caeaa286-640e-11eb-0e70-5ba4322a021b
# ╠═77698f2a-69aa-11eb-1d85-4f74a52bc9a8
# ╟─d04eacca-640e-11eb-37f7-65e31bcafddf
# ╟─19d941d4-640f-11eb-322d-43c8c17e1ca5
# ╟─7d6e156a-640f-11eb-03ff-9bf78a886890
# ╟─a72c4d38-6414-11eb-0323-2b101a96a4e2
# ╟─4827edf6-714d-11eb-1176-1d4368d4a161
# ╟─bc25a3bc-714b-11eb-19db-6b45c6ff60e0
# ╟─a9439dbc-714b-11eb-0b3f-954322529980
# ╟─88319290-6415-11eb-291c-79d1bf8ccd7b
# ╟─28002902-6415-11eb-3ec5-2ff429ee4125
# ╟─2f82e7f8-69af-11eb-283c-ebaba2ca091c
# ╟─1972b17a-6415-11eb-3a05-a76e20b37ce5
# ╟─8e4e197c-69a5-11eb-0e01-357faf0814f9
# ╟─6a6de6f6-69ad-11eb-3bc4-1f2622111a13
# ╟─4b243270-69b0-11eb-0f1d-e34a13c86159
# ╟─df33be38-6cab-11eb-1bc5-4d1f573ec5a2
# ╟─beba74a8-6cab-11eb-3e8a-81bf71d64a6c
# ╟─78c0541c-6cb4-11eb-292f-9bb43d2c7c36
# ╟─167880f2-6cae-11eb-10f9-695e95bea9dd
# ╟─1741635c-6cae-11eb-323c-dd7ff6ffa50e
# ╟─8fe6fddc-6cb4-11eb-344d-8d6687205f74
# ╟─76273888-6cb4-11eb-112d-91a3ed30a042
# ╟─d89b27d6-6cb4-11eb-0dd6-97376d57740c
# ╟─15f406b4-6417-11eb-1614-577cdf0f282c
# ╟─726a445c-641d-11eb-32eb-75df861e1b54
# ╠═94acde12-641d-11eb-1d7e-e369279bc92a
# ╟─dd5edda6-641d-11eb-0b53-9f486da7fae7
# ╟─33c3b41a-6425-11eb-05ef-21b215f827ad
# ╠═57bb103e-69b1-11eb-0fd0-9f5902a6c8ea
# ╠═6d816262-6cb6-11eb-1513-1b065fa019c6
# ╟─472062e2-6425-11eb-38d7-e764c0ccfc0a
# ╟─e529bb96-6425-11eb-04be-85ddcfcff418
# ╟─f9a3ca2c-7153-11eb-0408-1f0916e2d550
# ╟─431abf4c-69b8-11eb-18e4-2f2c769a85a1
# ╟─9d424d10-642b-11eb-0800-ed0461bad325
# ╠═f3ff887a-642b-11eb-0fdd-b5c7db6ec8cd
# ╟─ac6351b2-642c-11eb-2f61-ab08efb3c175
# ╟─031995ce-6a0f-11eb-29f9-599e9cfb8427
# ╠═dfaf8452-69bb-11eb-2204-eb4c3c503462
# ╠═bc7447c8-69bf-11eb-2a5b-ad28e93001d4
# ╠═8127fa76-6cc5-11eb-0245-7d18ec64d88f
# ╟─d9d18096-69b9-11eb-0111-9b62d1dec03d
# ╠═235970d6-7149-11eb-216e-715f195832e5
# ╟─b24a61da-69b1-11eb-231c-c5d49a44f578
# ╟─cf82c80c-6cc5-11eb-2999-2ff8fb008686
# ╟─d46fa5dc-69b3-11eb-3137-cbc9aa25ccd1
# ╟─38d448a8-6cc6-11eb-2523-d15337e10e66
# ╠═7b485b52-6cc6-11eb-3088-27d318c62764
