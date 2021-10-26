using bn_selling_bonsai.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace bn_selling_bonsai.Controllers
{
    public class LoginController : ApiController
    {

        DBSellingBonsai db = new DBSellingBonsai();
        // POST: api/Login
        public Account Post(Account account)
        {
            Account newAccount = null;
            newAccount = db.Accounts
                .Where(a => a.Email.Equals(account.Email) && a.Password.Equals(account.Password) && a.Status)
                .FirstOrDefault();
            newAccount.Bills = null;
            newAccount.Reviews = null;
            newAccount.Role = null;
            return newAccount;
        }

       
    }
}
