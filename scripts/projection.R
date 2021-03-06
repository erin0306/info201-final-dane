library(dplyr)
library(shiny)
library(plotly)
library(shinydashboard)

## Nam
employment_projection <- tabItem(
  tabName = "projection_tab",
  
  titlePanel("2016 - 2026 Employment Occupational Projection"),
  fluidRow(
    
    box(width = 2,
        title = "Widget", 
        status = "warning",
        solidHeader = TRUE,
        
        ## UW major type-in
        ## Based on what you typed here the major drop down would change.
        ## Type gibberish or nothing for all selection
        textInput(inputId = "UW_major_text",
                  label = "Type in your major here:",
                  value = NULL),
        
        ## UW major drop down
        ## Based on what you selected here your type of occupation available options would change
        selectInput(inputId = "UW_major_dropdown",
                    label = "Please select your major:",
                    choices = unique(uw_major_data$Major),
                    selected = "All"),
        
        ## Type of occupation type-in
        ## Based on what you typed here the type of occupation would change.
        ## Type gibberish or nothing for all selection
        textInput(inputId = "occ_major_text",
                  label = "Type in your type of occupation here:",
                  value = NULL),
        
        ## Type of occupation 
        ## Based on what you selected here your occupational groups available options would change
        selectInput(inputId = "occ_major",
                    label = "Please select a type of occupation (Suggested based on your major):",
                    choices = unique(occ_major$Jobs),
                    selected = "All"),
        
        ## Occupational Group type-in
        ## Based on what you typed here the occupational group would change.
        ## Type gibberish or nothing for all selection
        textInput(inputId = "occ_group_text",
                  label = "Type in your occupational group here:",
                  value = NULL),
        
        ## Occupational Group
        ## Based on what you selected here your Specific occupation would change
        ## Based on what you selected here our 2 charts would change
        selectInput(inputId = "occ_group",
                    label = "Please select an occupational group:",
                    choices = unique(occ_groups$Jobs),
                    selected = "Top executives"),
        
        ## Specific Occupation type-in
        ## Based on what you typed here the specific occupation would change
        textInput(inputId = "occ_text",
                  label = "Type in your specific occupational here:",
                  value = NULL),
        
        ## Specific Occupation
        ## Based on what you selected here the specific occupation Tab would change
        selectInput(inputId = "occ",
                    label = "Please select a specific occupation (Make sure to hunt for different Huskies):",
                    choices = unique(occ$Jobs),
                    selected = "Chief executives"),
        
        ## Set a limit on how many data point can be displayed in graph
        ## default : 20
        textInput(inputId = "limit_text",
                  label = "Please type in a limit for how many data point is displayed on graph (Default is 20):",
                  value = "20")
        
    ),
    
    ## 2016-2026 projection graph
    ## This is changed based on your selection of Occupational Group
    box(title = "2016 and 2026 employment projection between occupational group", 
        status = "info", 
        width = 10, 
        solidHeader = TRUE,
        plotlyOutput("employment_projection")
    ),
    
    ## median wage comparison graph
    ## This is changed based on your selection of Occupational Group
    box(title = "2017 median wage comparison between occupational group",
        status = "info",
        width = 10,
        solidHeader = TRUE,
        plotlyOutput("median_wage_compare")
    ),
    
    ## Specific occupation display
    ## Change based on specific occupation selection
    box(title = "Your specific occupation",
        status = "info",
        width = 12,
        solidHeader = TRUE,
        #textOutput("specific_source_code"),
        uiOutput("specific_occupation")
    )
  )
  
)
