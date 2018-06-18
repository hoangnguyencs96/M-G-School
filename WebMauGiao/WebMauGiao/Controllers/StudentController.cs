using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMauGiao.Service.Service;

namespace WebMauGiao.Controllers
{
    public class StudentController : SecurityController
    {
        // GET: Student
        [HttpGet]
        public ActionResult ListStudent()
        {
            F_STUDENT f_student = new F_STUDENT();
            var listStu = f_student.GetAll().OrderBy(x => x.Name);

            F_CLASS f_class = new F_CLASS();
            var listCla = f_class.GetAll().OrderBy(x => x.Name);

            Session["ListClass"] = listCla;

            return View(listStu);
        }

        //[HttpPost]

        //public ActionResult ListStudent()
        //{
        //    return View("");
        //}

        public JsonResult GetStudentByClass(string Name)
        {
            F_STUDENT f_student = new F_STUDENT();
            F_CLASS f_class = new F_CLASS();
            var className = f_class.GetSingleByCondition(x => x.Name == Name, null);

            var list_student = f_student.GetMany(x => x.ClassID == className.ClassID, null).OrderBy(x => x.Name).ToList();
            return Json(list_student, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAllStudents()
        {
            F_STUDENT f_student = new F_STUDENT();
            var all_student = f_student.GetAll().OrderBy(x => x.Name);
            return Json(all_student, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAStudent(long ID)
        {
            F_STUDENT f_student = new F_STUDENT();
            var student = f_student.GetSingleByCondition(x => x.StudentID == ID);
            return Json(student, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAClass(long ID)
        {
            F_CLASS f_class = new F_CLASS();
            var fclass = f_class.GetSingleByCondition(x => x.ClassID == ID);
            return Json(fclass, JsonRequestBehavior.AllowGet);
        }

        public ActionResult RollCall()
        {
            return View();
        }



        public ActionResult ClassArranger()
        {
            return View();
        }
    }
}