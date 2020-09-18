the_plan <- drake_plan(
    
    # loading data
    
    d = readRDS(file_in("data/data-final-2020-09-17.rds")),
  
    # create subpages
    
    descriptives = rmarkdown::render(
      knitr_in("descriptives.Rmd"),
      output_file = file_out("docs/descriptives.html"),
      params = list(d = d)
    ),
      
    dependencies = rmarkdown::render(
      knitr_in("dependencies.Rmd"),
      output_file = file_out("docs/dependencies.html")
    ),
    
    # render site
    
    rendered_site = render_site() 
)
