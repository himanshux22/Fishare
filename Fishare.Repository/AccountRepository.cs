﻿using System;
using Fishare.DAL;
using Fishare.DAL.Memory;
using Fishare.DAL.SQL;
using Fishare.Model;
using Fishare.Repository.Interface;
using Fishare.ViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;

namespace Fishare.Repository
{
    public class AccountRepository : Repository<User>, IAccountRepository
    {
        private IAccountRepository _context;

        /// <summary>
        /// Constructor to get the right context
        /// </summary>
        /// <param name="context"></param>
        public AccountRepository(IAccountRepository context)
        {
            _context = context;
        }

        public bool CheckLogin(string email, string password)
        {
            return _context.CheckLogin(email, password);
        }

        public bool Exist(string email)
        {
            return _context.Exist(email);
        }
    }
}
