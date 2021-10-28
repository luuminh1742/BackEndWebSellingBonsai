using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Http.Results;
using bn_selling_bonsai.Models;
using bn_selling_bonsai.Utils;
using MyFood.Utils;

namespace bn_selling_bonsai.Controllers
{
    public class ProductsController : ApiController
    {
        private DBSellingBonsai db = new DBSellingBonsai();

        // GET: api/Products
        public IQueryable<Product> GetProducts()
        {
            return db.Products;
        }


        [Route("api/ListProduct")]
        public IHttpActionResult GetProducts(
            int categoryId = 0,
            int page = 1,
            int pageSize = 10,
            int sortByPrice = 0,
            string search = null
            )
        {

            var result = db.Products.ToList();

            if (categoryId != 0)
            {
                result = result.Where(p => p.CategoryId == categoryId).ToList();
            }

            if (search != null)
            {
                result = result.Where(p => 
                RemoveVietnameseToneUtil.RemoveVietnameseTone(p.Name)
                .Contains(RemoveVietnameseToneUtil.RemoveVietnameseTone(search))).ToList();
            }
            int totalPage = (int)Math.Ceiling(result.Count() / (float)pageSize);
            if (page > totalPage) page = 1;
            int startRecord = (int)(page - 1) * pageSize;



            if (sortByPrice == 0)
            {
                result = result.OrderBy(p => p.Id).Skip(startRecord).Take(pageSize).ToList();
            }
            else if (sortByPrice == 1)
            {
                result = result.OrderBy(p => (p.Price * (100 - p.Discount) / 100)).Skip(startRecord).Take(pageSize).ToList();
            }
            else if (sortByPrice == -1)
            {
                result = result.OrderByDescending(p => (p.Price * (100 - p.Discount) / 100)).Skip(startRecord).Take(pageSize).ToList();
            }

            return Json(new { data = result, currentPage = page, totalPage = totalPage });
        }

        // GET: api/Products/5
        [ResponseType(typeof(Product))]
        public IHttpActionResult GetProduct(int id)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return NotFound();
            }

            return Ok(product);
        }

        // PUT: api/Products/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutProduct(int id, Product product, string FileName = null)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != product.Id)
            {
                return BadRequest();
            }
            product.ProductCategory = db.ProductCategories.Find(product.CategoryId);
            if (FileName != null)
            {
                string path = HttpContext.Current.Server.MapPath("~/wwwroot/images/");
                if (!UploadFileUtil.SaveFile(product.Image, FileName, path))
                {
                    return BadRequest();
                }
                product.Image = FileName;
            }
            db.Entry(product).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductExists(id))
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

        // POST: api/Products
        [ResponseType(typeof(Product))]
        public IHttpActionResult PostProduct(Product product, string FileName = null)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            product.ProductCategory = db.ProductCategories.Find(product.CategoryId);
            if (FileName != null)
            {
                string path = HttpContext.Current.Server.MapPath("~/wwwroot/images/");
                if (!UploadFileUtil.SaveFile(product.Image, FileName, path))
                {
                    return BadRequest();
                }
                product.Image = FileName;
            }
            db.Products.Add(product);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = product.Id }, product);
        }

        // DELETE: api/Products/5
        [ResponseType(typeof(Product))]
        public IHttpActionResult DeleteProduct(int id)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return NotFound();
            }

            db.Products.Remove(product);
            db.SaveChanges();

            return Ok(product);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProductExists(int id)
        {
            return db.Products.Count(e => e.Id == id) > 0;
        }
    }
}