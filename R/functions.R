
create_graph <- function(){
  vis_drake_graph(the_plan, file = "graph.html")
}

render_site <- function() {
  rmarkdown::render_site("docs")
}
