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
    public class RolesController : ApiController
    {
        private DBSellingBonsai db = new DBSellingBonsai();

        // GET: api/Roles
        public IQueryable<Role> GetRoles()
        {
            
            return db.Roles;
        }

        // GET: api/Roles/5
        [ResponseType(typeof(Role))]
        public IHttpActionResult GetRole(string id)
        {
            Role role = db.Roles.Find(id);
            role.Accounts.Clear();
            if (role == null)
            {
                return NotFound();
            }

            return Ok(role);
        }

        
        private bool RoleExists(string id)
        {
            return db.Roles.Count(e => e.Code == id) > 0;
        }
    }
}