---
title: Generating and download/email report in a R Shiny
date: 2019-04-14
tags: ["r"]
---
Most of the dashboards / R shiny app are viewed by the people who want to view the underyling data without doing much analysis. While they view the KPI's , the charts and the tables it would be also an important for them to take the results out of the app for meetings and presenations. One of way doing it is the traditionally downloading the reports. But to make it one step easier they could also be given an option to email these reports.Thats one way of making most out of such tools.

### Libraries
The libraries which we will be using are `shiny` for the app itself, `shinyFiles` and `fs` for selecting the files to be mailed and `shinyAce` and `mailR` for the email component of the app.


```
library(shiny)
library(shinyFiles)
library(fs)
library(shinyAce)
library(mailR)
```
 The app layout has a sidebar and a main panel. The sidebar has the download and the email functionality and the main panel has the plot . The user can donload the the report in mutiple formats.

![ui](ui_layout.png)

### Email component

The following code handles how to email from the app itself.Once the user downloads the report to their local drive, they can select any files they want to mail to using  `shinyFiles`

```
volumes <- c(Home = fs::path_home(), "R Installation" = R.home(), getVolumes()())
shinyFileChoose(input, "file", roots = volumes, session = session)
```

When the user clicks on the send button it takes the inputs such as to, the body of the mail and the file to be mailed which was selected by the user.In this app the email is configured via gmail but this can be done via Outlook as well.

```observe({
  if(is.null(input$send) || input$send==0) return(NULL)

  subject <- isolate(input$subject)
  msg <- isolate(input$message)
  sender <- "from@gmail.com"
  recipients <- isolate(input$to)
  path <- parseFilePaths(volumes, input$file)
  send.mail(from = sender,
            to = recipients,
            subject = subject,
            body = msg,
            #body,
            #attach.files = path$datapath,#file.path(folder, fileName),
            attach.files = path$datapath,
            smtp = list(host.name = "smtp.gmail.com", port = 465,
                        user.name=sender, passwd="*********", ssl=TRUE),
            authenticate = TRUE,
            send = TRUE)

})
```

Below is the code for downloading report. The user can download the reports in multiple formats. You could also write into powerpoints which can taken into weekly meetings.

```
output$downloadReport <- downloadHandler(
  filename = function() {
    paste('my-report', sep = '.', switch(
      input$format, PDF = 'pdf', HTML = 'html', Word = 'docx'
    ))
  },
  content = function(file) {
    src <- normalizePath('report.Rmd')

    # temporarily switch to the temp dir, in case you do not have write
    # permission to the current working directory
    owd <- setwd(tempdir())
    on.exit(setwd(owd))
    file.copy(src, 'report.Rmd', overwrite = TRUE)

    library(rmarkdown)
    out <- render('report.Rmd', switch(
      input$format,
      PDF = pdf_document(), HTML = html_document(), Word = word_document()
    ))
    file.rename(out, file)
  }
)
```
You can find the app [here](https://github.com/senthilthyagarajan/shinyemail).
