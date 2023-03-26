# QuizHoot

## Features

- Do quiz and view quiz result
- Create quiz and  for user

Images
![Quiz List](https://github.com/namhkse/Quizhoot/blob/main/documents/quiz-list.png?raw=true)

![Do Quiz](https://github.com/namhkse/Quizhoot/blob/main/documents/do-quiz.png?raw=true)

![Review Quiz](https://github.com/namhkse/Quizhoot/blob/main/documents/review-quiz.png?raw=true)

![Edit Question](https://github.com/namhkse/Quizhoot/blob/main/documents/edit-question.png?raw=true)

![Edit Quiz](https://github.com/namhkse/Quizhoot/blob/main/documents/edit-quiz.png?raw=true)
## Tech

QuizHoot uses a number of open source projects to work properly:

- [Bootstrap] - HTML enhanced for web apps!
- [jQuery] - write less, do more
- [ASP.NET] - Backend
- [MSSQL] - Database

## Installation

Create database by run QuizHootDB.sql in documents folder
or use migrations 
```sh
dotnet ef database update --context QuizHootContext
```

For run application

```sh
dotnet run
```

## Document
**Application's document in documents folder.**

- SD Document.docx
- account.txt(sample account in app)
- QuizHootDB.sql(database scheme and sample data)
