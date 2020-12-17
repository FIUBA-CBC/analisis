from big_ol_pile_of_manim_imports import *

	
class Seno(GraphScene):
    CONFIG = {
    "function" : lambda x : np.sin(x),
    "function_color" : BLUE,
    "taylor" : [lambda x: x, lambda x: x-x**3/math.factorial(3), lambda x: x-x**3/math.factorial(3)+x**5/math.factorial(5), lambda x: x-x**3/math.factorial(3)+x**5/math.factorial(5)-x**7/math.factorial(7),
    lambda x: x-x**3/math.factorial(3)+x**5/math.factorial(5)-x**7/math.factorial(7)+x**9/math.factorial(9), lambda x: x-x**3/math.factorial(3)+x**5/math.factorial(5)-x**7/math.factorial(7)+x**9/math.factorial(9) - x**11/math.factorial(11)],
    "center_point" : 0,
    "approximation_color" : GREEN,
    "x_min" : -10,
    "x_max" : 10,
    "y_min" : -1,
    "y_max" : 1,
    "graph_origin" : ORIGIN ,
    "x_labeled_nums" :range(-10,12,2),
    
    }
    def construct(self):
        self.setup_axes(animate=True)
        func_graph = self.get_graph(
        self.function,
        self.function_color,
    )
        approx_graphs = [
        self.get_graph(
        f,
        self.approximation_color
    )
        for f in self.taylor
    ]
    
        term_num = [
        TexMobject("n = " + str(n),aligned_edge=TOP)
        for n in range(0,8)]
        [t.to_edge(BOTTOM,buff=SMALL_BUFF) for t in term_num]
        
        term = TexMobject("")
        term.to_edge(BOTTOM,buff=SMALL_BUFF)
        
        approx_graph = VectorizedPoint(
        self.input_to_graph_point(self.center_point, func_graph)
        )
    
        self.play(
        ShowCreation(func_graph),
        )
        for n,graph in enumerate(approx_graphs):
            self.play(
            Transform(approx_graph, graph, run_time = 4),
            Transform(term,term_num[n])
        )
        self.wait()