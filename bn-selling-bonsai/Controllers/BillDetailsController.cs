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
    public class BillDetailsController : ApiController
    {
        private DBSellingBonsai db = new DBSellingBonsai();

        // GET: api/BillDetails
        public IQueryable<BillDetail> GetBillDetails(int billId)
        {
            var result = db.BillDetails.Where(bd=>bd.BillId == billId);
            return result;
        }

        // GET: api/BillDetails/5
        [ResponseType(typeof(BillDetail))]
        public IHttpActionResult GetBillDetail(int id)
        {
            BillDetail billDetail = db.BillDetails.Find(id);
            if (billDetail == null)
            {
                return NotFound();
            }

            return Ok(billDetail);
        }

        // PUT: api/BillDetails/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutBillDetail(int id, BillDetail billDetail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != billDetail.Id)
            {
                return BadRequest();
            }

            db.Entry(billDetail).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BillDetailExists(id))
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

        // POST: api/BillDetails
        [ResponseType(typeof(BillDetail))]
        public IHttpActionResult PostBillDetail(BillDetail billDetail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            billDetail.Bill = db.Bills.Find(billDetail.BillId);
            billDetail.Product = db.Products.Find(billDetail.ProductId);
            db.BillDetails.Add(billDetail);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = billDetail.Id }, billDetail);
        }

        // DELETE: api/BillDetails/5
        [ResponseType(typeof(BillDetail))]
        public IHttpActionResult DeleteBillDetail(int id)
        {
            BillDetail billDetail = db.BillDetails.Find(id);
            if (billDetail == null)
            {
                return NotFound();
            }

            db.BillDetails.Remove(billDetail);
            db.SaveChanges();

            return Ok(billDetail);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool BillDetailExists(int id)
        {
            return db.BillDetails.Count(e => e.Id == id) > 0;
        }
    }
}