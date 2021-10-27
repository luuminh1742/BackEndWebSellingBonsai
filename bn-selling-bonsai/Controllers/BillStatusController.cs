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
    public class BillStatusController : ApiController
    {
        private DBSellingBonsai db = new DBSellingBonsai();

        // GET: api/BillStatus
        public IQueryable<BillStatu> GetBillStatus(int billId)
        {
            var result = db.BillStatus.Where(bs => bs.BillId == billId);
            return result;
        }

        // GET: api/BillStatus/5
        [ResponseType(typeof(BillStatu))]
        public IHttpActionResult GetBillStatu(int id)
        {
            BillStatu billStatu = db.BillStatus.Find(id);
            if (billStatu == null)
            {
                return NotFound();
            }

            return Ok(billStatu);
        }

        // PUT: api/BillStatus/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutBillStatu(int id, BillStatu billStatu)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != billStatu.Id)
            {
                return BadRequest();
            }
            DateTime localDate = DateTime.Now;
            billStatu.ModifiedDate = localDate;
            db.Entry(billStatu).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BillStatuExists(id))
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

        // POST: api/BillStatus
        [ResponseType(typeof(BillStatu))]
        public IHttpActionResult PostBillStatu(BillStatu billStatu)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            DateTime localDate = DateTime.Now;
            billStatu.ModifiedDate = localDate;
            db.BillStatus.Add(billStatu);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = billStatu.Id }, billStatu);
        }

        // DELETE: api/BillStatus/5
        [ResponseType(typeof(BillStatu))]
        public IHttpActionResult DeleteBillStatu(int id)
        {
            BillStatu billStatu = db.BillStatus.Find(id);
            if (billStatu == null)
            {
                return NotFound();
            }

            db.BillStatus.Remove(billStatu);
            db.SaveChanges();

            return Ok(billStatu);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool BillStatuExists(int id)
        {
            return db.BillStatus.Count(e => e.Id == id) > 0;
        }
    }
}