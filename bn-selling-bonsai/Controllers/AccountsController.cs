using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Mvc;
using bn_selling_bonsai.Models;

namespace bn_selling_bonsai.Controllers
{
    public class AccountsController : ApiController
    {
        private DBSellingBonsai db = new DBSellingBonsai();



        // GET: api/Accounts
        public IQueryable<Account> GetAccounts()
        {
            return db.Accounts;
        }

        // GET: api/Accounts/5
        [ResponseType(typeof(Account))]
        public IHttpActionResult GetAccount(int id)
        {
            Account account = db.Accounts.Find(id);
            if (account == null)
            {
                return NotFound();
            }

            return Ok(account);
        }
        public class ChangePass
        {
            public int AccountId { get; set; }
            public string OldPassword { get; set; }
            public string NewPassword { get; set; }

        }
        // PUT: api/Accounts/5
        [System.Web.Http.Route("api/UpdatePassword")]
        [ResponseType(typeof(bool))]
        public IHttpActionResult PutAccount(ChangePass changePass)
        {
            var accountUpdate = db.Accounts.Find(changePass.AccountId);
            if (!accountUpdate.Password.Equals(changePass.OldPassword))
            {
                return Ok(false);
            }
            accountUpdate.Password = changePass.NewPassword;
            db.Entry(accountUpdate).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AccountExists(changePass.AccountId))
                {
                    return Ok(false);
                }
                else
                {
                    throw;
                }
            }
            return Ok(true);
        }

        // PUT: api/Accounts/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutAccount(int id,
            [Bind(Include = "Email,FullName,Phone,Address")] Account account)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != account.Id)
            {
                return BadRequest();
            }
            var accountUpdate = db.Accounts.Find(id);

            accountUpdate.FullName = account.FullName;
            accountUpdate.Email = account.Email;
            accountUpdate.Phone = account.Phone;
            accountUpdate.Address = account.Address;
            db.Entry(accountUpdate).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AccountExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Accounts
        [ResponseType(typeof(Account))]
        public IHttpActionResult PostAccount(Account account)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            account.Role = db.Roles.Where(r => r.Code.Equals(account.RoleCode)).FirstOrDefault();
            account.Status = true;
            db.Accounts.Add(account);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = account.Id }, account);
        }

        // DELETE: api/Accounts/5
        [ResponseType(typeof(Account))]
        public IHttpActionResult DeleteAccount(int id)
        {
            Account account = db.Accounts.Find(id);
            if (account == null)
            {
                return NotFound();
            }

            db.Accounts.Remove(account);
            db.SaveChanges();

            return Ok(account);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AccountExists(int id)
        {
            return db.Accounts.Count(e => e.Id == id) > 0;
        }
    }
}