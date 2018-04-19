﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Fishare.Model;
using Fishare.Logic;
using Fishare.ViewModels;
using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.Configuration;

namespace Fishare.Controllers
{

    public class AccountController : Controller
    {
        private AccountLogic _accountLogic;

        public AccountController(IConfiguration config)
        {
            _accountLogic = new AccountLogic(config);
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginViewModel model)
        {

            bool userExist = _accountLogic.CheckLogin(model.Email, model.Password);

            if (userExist)
            {
                User UserInfo = _accountLogic.GetUser(model.Email);

                if (UserInfo != null)
                {
                    

                    var Claims = new List<Claim>
                    {
                        new Claim("Id", UserInfo.UserID.ToString()),
                        new Claim("Name", UserInfo.UserName),
                    };

                    var claimsIdentity = new ClaimsIdentity(
                        Claims, "FishCookies");

                    await HttpContext.SignInAsync(
                        "FishCookies",
                        new ClaimsPrincipal(claimsIdentity),
                        new AuthenticationProperties
                        {
                            IsPersistent = model.Remember
                        });

                    return RedirectToAction("TimeLine", "Timeline");
                }
                else
                {
                    ViewData["ErrorGetUser"] = "Oops something whent wrong!";
                    return View();
                }
            } 
            else
            {
                ViewData["ErrorNoUser"] = "Email or password does not exist! Please try again";
                return View();
            }
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(User model)
        {
            try
            {
                bool UserCreated = _accountLogic.CreateUser(model);

                if (UserCreated)
                {
                    ViewData["UserCreateSucces"] = "Your account is succesfull created! You can now login.";
                    return RedirectToAction("Login", "Account");
                }
                else
                {
                    ViewData["UserCreateFailed"] = "Oops something went wrong! your account has failed to create!";
                    return View();
                }
            }
            catch (ExceptionHandler exception)
            {
                ViewData[exception.Index] = exception.Message;
                return View();
            }
        }
    }
}