﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TrulyHotelAPI.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            //This is test
            ViewBag.Title = "Home Page";

            return View();
        }
    }
}
