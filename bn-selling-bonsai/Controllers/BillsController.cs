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
using bn_selling_bonsai.Models;

namespace bn_selling_bonsai.Controllers
{
    public class BillsController : ApiController
    {
        private DBSellingBonsai db = new DBSellingBonsai();

        // GET: api/Bills
        public IQueryable<Bill> GetBills()
        {
            return db.Bills.OrderByDescending(b => b.Id);
        }


        [Route("api/BillsFilter")]
        public IQueryable<Bill> GetBill(int accountId = 0, byte code = 0)
        {
            IQueryable<Bill> result = db.Bills;
            if (accountId > 0)
            {
                result = result.Where(b => b.AccountId == accountId);
            }
            result = result.Where(b => b.AtStatusCode == code);

            return result;
        }



        // GET: api/Bills/5
        [ResponseType(typeof(Bill))]
        public IHttpActionResult GetBill(int id)
        {
            Bill bill = db.Bills.Find(id);
            if (bill == null)
            {
                return NotFound();
            }

            return Ok(bill);
        }

        // PUT: api/Bills/5
        [Route("api/UpdateBill")]
        [ResponseType(typeof(void))]
        public IHttpActionResult PutBill(int id , byte code )
        {
            Bill bill = db.Bills.Find(id);

            bill.AtStatusCode = code;

            db.Entry(bill).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BillExists(id))
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

        // POST: api/Bills
        [ResponseType(typeof(Bill))]
        public IHttpActionResult PostBill(Bill bill)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Bills.Add(bill);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = bill.Id }, bill);
        }

        // DELETE: api/Bills/5
        [ResponseType(typeof(Bill))]
        public IHttpActionResult DeleteBill(int id)
        {
            Bill bill = db.Bills.Find(id);
            if (bill == null)
            {
                return NotFound();
            }

            db.Bills.Remove(bill);
            db.SaveChanges();

            return Ok(bill);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool BillExists(int id)
        {
            return db.Bills.Count(e => e.Id == id) > 0;
        }
    }
}