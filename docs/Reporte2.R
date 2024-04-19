library(shiny)

ui <- fluidPage(
  titlePanel("Generador de Informes"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("informe_type", "Tipo de informe:",
                  choices = c("Informe 1", "Informe 2")),
      conditionalPanel(
        condition = "input.informe_type != 'Seleccione'",
        selectInput("subinforme_type", "Subinforme:",
                    choices = c("Subinforme A", "Subinforme B")),
        conditionalPanel(
          condition = "input.subinforme_type != 'Seleccione'",
          selectInput("subsubinforme_type", "Subsubinforme:",
                      choices = c("Subsubinforme 1", "Subsubinforme 2", "Subsubinforme 3"))
        )
      )
    ),
    
    mainPanel(
      downloadButton("download_report", "Descargar informe")
    )
  )
)

server <- function(input, output) {
  
  generate_report <- function(informe_type, subinforme_type, subsubinforme_type) {
    if (informe_type == "Informe 1") {
      if (subinforme_type == "Subinforme A") {
        if (subsubinforme_type == "Subsubinforme 1") {
          # Generar contenido del Subsubinforme 1 de Subinforme A de Informe 1
          report_content <- "Este es el contenido del Subsubinforme 1 de Subinforme A de Informe 1."
        } else if (subsubinforme_type == "Subsubinforme 2") {
          # Generar contenido del Subsubinforme 2 de Subinforme A de Informe 1
          report_content <- "Este es el contenido del Subsubinforme 2 de Subinforme A de Informe 1."
        } else {
          # Generar contenido del Subsubinforme 3 de Subinforme A de Informe 1
          report_content <- "Este es el contenido del Subsubinforme 3 de Subinforme A de Informe 1."
        }
      } else {
        if (subsubinforme_type == "Subsubinforme 1") {
          # Generar contenido del Subsubinforme 1 de Subinforme B de Informe 1
          report_content <- "Este es el contenido del Subsubinforme 1 de Subinforme B de Informe 1."
        } else if (subsubinforme_type == "Subsubinforme 2") {
          # Generar contenido del Subsubinforme 2 de Subinforme B de Informe 1
          report_content <- "Este es el contenido del Subsubinforme 2 de Subinforme B de Informe 1."
        } else {
          # Generar contenido del Subsubinforme 3 de Subinforme B de Informe 1
          report_content <- "Este es el contenido del Subsubinforme 3 de Subinforme B de Informe 1."
        }
      }
    } else {
      if (subinforme_type == "Subinforme A") {
        if (subsubinforme_type == "Subsubinforme 1") {
          # Generar contenido del Subsubinforme 1 de Subinforme A de Informe 2
          report_content <- "Este es el contenido del Subsubinforme 1 de Subinforme A de Informe 2."
        } else if (subsubinforme_type == "Subsubinforme 2") {
          # Generar contenido del Subsubinforme 2 de Subinforme A de Informe 2
          report_content <- "Este es el contenido del Subsubinforme 2 de Subinforme A de Informe 2."
        } else {
          # Generar contenido del Subsubinforme 3 de Subinforme A de Informe 2
          report_content <- "Este es el contenido del Subsubinforme 3 de Subinforme A de Informe 2."
        }
      } else {
        if (subsubinforme_type == "Subsubinforme 1") {
          # Generar contenido del Subsubinforme 1 de Subinforme B de Informe 2
          report_content <- "Este es el contenido del Subsubinforme 1 de Subinforme B de Informe 2."
        } else if (subsubinforme_type == "Subsubinforme 2") {
          # Generar contenido del Subsubinforme 2 de Subinforme B de Informe 2
          report_content <- "Este es el contenido del Subsubinforme 2 de Subinforme B de Informe 2."
        } else {
          # Generar contenido del Subsubinforme 3 de Subinforme B de Informe 2
          report_content <- "Este es el contenido del Subsubinforme 3 de Subinforme B de Informe 2."
        }
      }
    }
    return(report_content)
  }
  
  output$download_report <- downloadHandler(
    filename = function() {
      paste("Informe_", input$informe_type, "_", input$subinforme_type, "_", input$subsubinforme_type, ".txt", sep = "")
    },
    
    content = function(file) {
      report <- generate_report(input$informe_type, input$subinforme_type, input$subsubinforme_type)
      writeLines(report, file)
    }
  )
}

shinyApp(ui = ui, server = server)
