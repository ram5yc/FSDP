using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FSDP.DATA.EF;
using Microsoft.AspNet.Identity;
using PagedList;

namespace FSDP.UI.MVC.Controllers
{
    [Authorize]
    public class OpenPositionsController : Controller
    {
        private FSDPEntities db = new FSDPEntities();


        public ActionResult Apply(int id) //what is filling out application when employee clicks to apply
        {
            Application app = new Application();

            app.UserId = User.Identity.GetUserId();
            app.OpenPositionId = id;
            app.ApplicationDate = DateTime.Now;
            app.ManagerNote = " "; //leave empty
            app.ApplicationStatus = 5; //choose 1 if 5 is not working(pending)
            string appUser = User.Identity.GetUserId(); //create another variable for top variable to flow into, method that comes with Identity samples that grabs whoever is on site
            UserDetail userDetail = db.UserDetails.Where(x => x.UserId == appUser).SingleOrDefault(); //SingleOrDefault returns only the element of the sequence
         
            app.ResumeFilename = userDetail.ResumeFilename; //transferring above data to the application
            db.Applications.Add(app);
            db.SaveChanges();
            //go to openposition in tt files to complete this
            return RedirectToAction("Index", "Applications");
        }

        //public ActionResult Applications()
        //{
        //    UserDetail ud = new UserDetail();

        //    ud.UserId = User.Identity.GetUserId();
        //    ud.FullName = 
        //        return View();
        //}

        // GET: OpenPositions
        public ActionResult Index(string searchLocation, int page = 1, int locationid = -1)
        {
            int pageSize = 10;

            var openPositions = db.OpenPositions.OrderBy(p => p.Location.State).ToList();
            #region Search Logic
            if (!string.IsNullOrEmpty(searchLocation))
            {
                openPositions = openPositions.Where(p => p.Location.State.ToLower().Contains(searchLocation.ToLower())).ToList();
            }
            ViewBag.SearchLocation = searchLocation;
            #endregion
            //var openPositions = db.OpenPositions.Include(o => o.Location).Include(o => o.Position);
            return View(openPositions.ToPagedList(page,pageSize));
        }

        // GET: OpenPositions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPosition openPosition = db.OpenPositions.Find(id);
            if (openPosition == null)
            {
                return HttpNotFound();
            }
            return View(openPosition);
        }

        // GET: OpenPositions/Create
        public ActionResult Create()
        {
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "StoreNumber");
            ViewBag.PositionId = new SelectList(db.Positions, "PositionId", "Title");
            return View();
        }

      
        // POST: OpenPositions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OpenPositionId,PositionId,LocationId")] OpenPosition openPosition)
        {
            if (ModelState.IsValid)
            {
                db.OpenPositions.Add(openPosition);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "StoreNumber", openPosition.LocationId);
            ViewBag.PositionId = new SelectList(db.Positions, "PositionId", "Title", openPosition.PositionId);
            return View(openPosition);
        }

        // GET: OpenPositions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPosition openPosition = db.OpenPositions.Find(id);
            if (openPosition == null)
            {
                return HttpNotFound();
            }
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "StoreNumber", openPosition.LocationId);
            ViewBag.PositionId = new SelectList(db.Positions, "PositionId", "Title", openPosition.PositionId);
            return View(openPosition);
        }

        // POST: OpenPositions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OpenPositionId,PositionId,LocationId")] OpenPosition openPosition)
        {
            if (ModelState.IsValid)
            {
                db.Entry(openPosition).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "StoreNumber", openPosition.LocationId);
            ViewBag.PositionId = new SelectList(db.Positions, "PositionId", "Title", openPosition.PositionId);
            return View(openPosition);
        }

        // GET: OpenPositions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPosition openPosition = db.OpenPositions.Find(id);
            if (openPosition == null)
            {
                return HttpNotFound();
            }
            return View(openPosition);
        }

        // POST: OpenPositions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            OpenPosition openPosition = db.OpenPositions.Find(id);
            db.OpenPositions.Remove(openPosition);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
