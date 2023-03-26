using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QuizHoot.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Identity;
using System.Threading.Tasks;
using System.Security.Claims;
using QuizHoot.Areas.Identity.Data;
using QuizHoot.Models.ViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.SignalR;
using QuizHoot.Hubs;

namespace QuizHoot.Controllers
{
    public class QuizController : Controller
    {
        private readonly QuizHootContext _context;
        private readonly UserManager<QuizHootUser> _userManager;
        private readonly IHubContext<SignalRServer> _hubContext;
        public QuizController(QuizHootContext ctx, UserManager<QuizHootUser> userManager, IHubContext<SignalRServer> hubContext)
        {
            _context = ctx;
            _userManager = userManager;
            _hubContext = hubContext;
        }

        public IActionResult List(string txtsearch)
        {

            List<Quiz> quizzes = (txtsearch is null || txtsearch.Trim() == "")
                ? _context.Quizzes.Include(q => q.Creator).Where(q => q.Publish).ToList()
                : _context.Quizzes.Include(q => q.Creator).Where(q => q.Publish && (q.QuizId.ToString().Contains(txtsearch.ToLower())
                    || q.Title.ToLower().Contains(txtsearch.ToLower()))).ToList();


            var quizViewModels = new List<QuizViewModel>();

            foreach (var q in quizzes)
            {
                int amount = _context.TakeQuizzes.Where(tq => tq.QuizId == q.QuizId).Count();
                var qv = new QuizViewModel();
                qv.Quiz = q;
                qv.TotalQuestion = _context.Questions.Where(q => q.QuizId == qv.Quiz.QuizId).Count();
                qv.PlayQuizNumber = amount;
                quizViewModels.Add(qv);
            }

            return View(quizViewModels);
        }

        public IActionResult DoQuiz(int qid)
        {
            var user = HttpContext.User;

            if (!user.Identity.IsAuthenticated)
            {
                return Redirect("/Identity/Account/Login");
            }

            var uId = _userManager.GetUserId(user);
            var startTime = DateTime.Now;
            var quiz = _context.Quizzes.Find(qid);

            if (quiz is null) return NotFound();
            if (!quiz.Publish) return Content("Quiz is not avaiable.");
            if (quiz.StartAt is not null && startTime < quiz.StartAt)
            {
                ViewData["ErrorMessage"] = "This quiz is not started.";
                return View("ErrorPage");
            }

            if (quiz.EndAt is not null && quiz.EndAt < startTime)
            {
                ViewData["ErrorMessage"] = "The time to take this test has expired.";
                return View("ErrorPage");
            }

            TakeQuiz takeQuiz = new TakeQuiz
            {
                StartAt = DateTime.Now,
                FinishAt = null,
                Score = 0,
                QuizId = qid,
                UserId = uId
            };

            _context.TakeQuizzes.Add(takeQuiz);
            _context.SaveChanges();

            return RedirectToAction("DoQuizInProcess", new
            {
                takeQuizId = takeQuiz.TakeQuizId
            });
        }

        public IActionResult DoQuizInProcess(int takeQuizId)
        {

            var uId = _userManager.GetUserId(HttpContext.User);

            TakeQuiz takeQuiz = _context.TakeQuizzes
                .Where(tq => tq.TakeQuizId == takeQuizId && tq.UserId.Equals(uId))
                .FirstOrDefault();

            if (takeQuiz is null)
            {
                ViewData["ErrorCode"] = "404";
                ViewData["ErrorMessage"] = "PAGE NOT FOUND";
                ViewData["ErrorDescription"] = "The page you are looking for might have been removed had its name changed or is temporarily unavailable.";
                return View("ErrorPage");
            }

            var quiz = _context.Quizzes.Where(q => q.QuizId == takeQuiz.QuizId)
                .Include(q => q.Questions).ThenInclude(qs => qs.Answers).First();

            ViewBag.TakeQuiz = takeQuiz;
            return View(quiz);
        }

        [HttpPost]
        public IActionResult SubmitAnswer(List<string> selectAnswers, int takeQuizId)
        {
            var uId = _userManager.GetUserId(HttpContext.User);

            TakeQuiz takeQuiz = _context.TakeQuizzes
                .Where(tq => tq.TakeQuizId == takeQuizId && tq.UserId == uId)
                .FirstOrDefault();

            // user not start do this quiz
            if (takeQuiz is null)
            {
                ViewData["ErrorCode"] = "404";
                ViewData["ErrorMessage"] = "PAGE NOT FOUND";
                ViewData["ErrorDescription"] = "The page you are looking for might have been removed had its name changed or is temporarily unavailable.";
                return View("ErrorPage");
            }

            var quiz = _context.Quizzes.Find(takeQuiz.QuizId);

            if (quiz.EndAt is not null && quiz.EndAt < DateTime.Now)
            {
                ViewData["ErrorMessage"] = "Submit Answer Fail!";
                ViewData["ErrorDescription"] = "Time is expired";
                return View("ErrorPage");
            }

            if (takeQuiz.FinishAt is not null)
            {
                ViewData["ErrorMessage"] = "Submit Answer Fail!";
                ViewData["ErrorDescription"] = "This quiz was submited, can't resubmit.";
                return View("ErrorPage");

            }

            takeQuiz.FinishAt = DateTime.Now;
            _context.TakeQuizzes.Update(takeQuiz);

            foreach (var a in selectAnswers)
            {
                var tokens = a.Split("-");
                int questionId = int.Parse(tokens[0]);
                int answerId = int.Parse(tokens[1]);

                _context.Add(new TakeAnswer
                {
                    TakeQuizId = takeQuiz.TakeQuizId,
                    QuestionId = questionId,
                    AnswerId = answerId
                });
            }


            _context.Update(takeQuiz);
            _context.SaveChanges();
            //Only after insert answer you can caculate score
            takeQuiz.Score = caculateScore(takeQuiz.TakeQuizId);
            _context.SaveChanges();

            ViewData["ErrorMessage"] = "Submit successfully!";
            return View("ErrorPage");
        }


        public IActionResult MyQuiz()
        {
            return View();
        }

        public IActionResult Edit(int id)
        {
            ViewBag.Id = id;
            Quiz quiz = _context.Quizzes.First(s => s.QuizId == id);
            ViewBag.Quiz = quiz;
            List<Question> listQuestion = _context.Questions.Include(s => s.Level).Include(s => s.Quiz).Include(s => s.Answers).Where(s => s.QuizId == id).ToList<Question>();
            ViewBag.listQuestion = listQuestion;
            var listLevel = _context.Levels.ToList<Level>();
            ViewBag.listLevel = listLevel;
            return View();
        }
        // id is  TakeQuiz.TakeQuizID
        public IActionResult Review(int id)
        {
            TakeQuiz takeQuiz = _context.TakeQuizzes.Find(id);
            var takeAnswer = _context.TakeAnswers
                .Where(ta => ta.TakeQuizId == takeQuiz.TakeQuizId).ToList();

            var reviewModel = new ReviewQuizViewModel();
            reviewModel.TakeQuiz = takeQuiz;
            reviewModel.Quiz = _context.Quizzes.Find(takeQuiz.QuizId);
            reviewModel.Questions = _context.Questions.Include(q => q.Answers)
                .Where(q => q.QuizId == reviewModel.Quiz.QuizId)
                .ToList();

            foreach (var q in reviewModel.Questions)
            {
                foreach (var a in q.Answers)
                {
                    var ck = takeAnswer.Any(n => n.AnswerId == a.AnswerId);
                    reviewModel.ReviewAnswer.Add(a, ck);
                }


                var originalAnswers = q.Answers.Where(a => a.Correct).Select(a => a.AnswerId).OrderBy(k => k).ToList();

                var compareAnswer = takeAnswer.Where(a => a.QuestionId == q.QuestionId).
                    Select(a => a.AnswerId).OrderBy(k => k).ToList();

                bool canGetFullQuestionScore = Enumerable.SequenceEqual(originalAnswers, compareAnswer);

                reviewModel.QuestionScore[q.QuestionId] = (canGetFullQuestionScore) ? q.Score : 0;
            }

            reviewModel.TotalScore = caculateScore(id);
            return View(reviewModel);
        }

        private int caculateScore(int takeQuizId)
        {
            TakeQuiz takeQuiz = _context.TakeQuizzes.Find(takeQuizId);

            if (takeQuiz is null) throw new Exception("Not found take quiz");

            var questions = _context.Questions.Where(q => q.QuizId == takeQuiz.QuizId).Include(q => q.Answers).ToList();
            var userAnswers = _context.TakeAnswers.Where(ta => ta.TakeQuizId == takeQuizId).ToList();

            if (userAnswers.Count == 0) return 0;
            int score = 0;

            foreach (var q in questions)
            {
                var trueAnwersOfQuestion = q.Answers.Where(a => a.Correct).Select(a => a.AnswerId).OrderBy(k => k).ToList();
                var userAnswerOfQuestion = userAnswers.Where(a => a.QuestionId == q.QuestionId).Select(a => a.AnswerId).OrderBy(k => k).ToList();
                if (Enumerable.SequenceEqual(trueAnwersOfQuestion, userAnswerOfQuestion))
                {
                    score += q.Score;
                }
            }

            return score;
        }

        // Crud part
        public IActionResult Detail(int id)
        {
            Quiz quiz = _context.Quizzes.Find(id);
            return View(quiz);
        }

        [HttpPost]
        public IActionResult Create(Quiz quiz, string returnUrl)
        {
            quiz.CreatorId = _userManager.GetUserId(HttpContext.User);
            _context.Add(quiz);
            _context.SaveChanges();
            _hubContext.Clients.All.SendAsync("CreateQuiz");
            return Redirect(returnUrl);
        }

        [HttpPost]
        public IActionResult Update(Quiz q, string returnUrl)
        {
            var uId = _userManager.GetUserId(HttpContext.User);
            q.CreatorId = uId;
            _context.Update(q);
            _context.SaveChanges();
            return Redirect(returnUrl);
        }

        public IActionResult Delete(int id, string returnUrl)
        {
            var q = _context.Quizzes.Find(id);
            _context.Quizzes.Remove(q);
            _context.SaveChanges();
            return Redirect(returnUrl);
        }
        // End Crud part
        [HttpGet]
        public IActionResult ViewQuizResult(int? id)
        {
            var uId = _userManager.GetUserId(HttpContext.User);

            var takeQuizzes = _context.TakeQuizzes
            .Include(tq => tq.Quiz)
            .Where(tq => tq.UserId.Equals(uId))
            .OrderByDescending(tq => tq.FinishAt)
            .ToList();
            return View(takeQuizzes);
        }

        [HttpPost]
        public IActionResult ViewQuizResult(string? txtsearch)
        {
            var uId = _userManager.GetUserId(HttpContext.User);

            if(txtsearch == null || txtsearch == "")
            {
                var takeQuizzes = _context.TakeQuizzes
                .Include(tq => tq.Quiz)
                .Where(tq => tq.UserId.Equals(uId))
                .OrderByDescending(tq => tq.FinishAt)
                .ToList();
                return View(takeQuizzes);
            } else
            {
                var takeQuizzes = _context.TakeQuizzes
                .Include(tq => tq.Quiz)
                .Where(tq => tq.UserId.Equals(uId) && tq.Quiz.Title.Contains(txtsearch))
                .OrderByDescending(tq => tq.FinishAt)
                .ToList();
                return View(takeQuizzes);
            }
            
        }

        [HttpGet]
        public IActionResult Manage(int? id)
        {
            if (!HttpContext.User.Identity.IsAuthenticated)
            {
                return Redirect("/Identity/Account/Login");
            }
            var uId = _userManager.GetUserId(HttpContext.User);
            var quizzes = _context.Quizzes.Where(q => q.CreatorId.Equals(uId)).ToList();
            return View(quizzes);
        }
        [HttpPost]
        public IActionResult Manage(string? txtsearch)
        {
            if (!HttpContext.User.Identity.IsAuthenticated)
            {
                return Redirect("/Identity/Account/Login");
            }
            var uId = _userManager.GetUserId(HttpContext.User);
            if(txtsearch == null || txtsearch == "")
            {
                var quizzes = _context.Quizzes.Where(q => q.CreatorId.Equals(uId)).ToList();
                return View(quizzes);
            } else
            {
                var quizzes = _context.Quizzes.Where(q => q.CreatorId.Equals(uId) && q.Title.Contains(txtsearch)).ToList();
                return View(quizzes);
            }
            
        }
        public IActionResult AllResults(int id)
        {
            ViewBag.Id = id;
            var listTakeQuiz = _context.TakeQuizzes.Include(q => q.Quiz).Include(q => q.User).Where(s => s.QuizId == id).ToList<TakeQuiz>();
            ViewBag.listTakeQuiz = listTakeQuiz;
            return View();
        }
    }
}
