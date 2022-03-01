using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Note.BLL;
using Note.MVC6.Models;

namespace Note.MVC6.Controllers
{
    public class HomeController : Controller
    {
        private readonly UserBLL _userBll;

        public HomeController(UserBLL userBll)
        {
            _userBll = userBll;
        }
        public IActionResult Index()
        {
            var user = _userBll.GetUser(1);
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
