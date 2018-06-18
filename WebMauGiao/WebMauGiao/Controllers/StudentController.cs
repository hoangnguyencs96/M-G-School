using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMauGiao.Service.Service;
using WebMauGiao.Service.Models;


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

        public JsonResult GetStudentByClassName(string Name)
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
            ViewBag.ListClass = new F_CLASS().GetAll().ToList();
            return View();
        }



        public ActionResult ClassArranger()
        {
            return View();
        }

        #region RollCall_Function


        public JsonResult GetStudentByClass(int classid)
        {
            var data = new F_STUDENT().GetAll().Where(x => x.ClassID == classid).ToList();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAbsence(int studentid, int month, int year)
        {
            var data = new F_ABSENCE().GetAbsenceByClass(studentid, month, year).ToList();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public JsonResult UpdateAbsence(long absenceid, long studentid, DateTime date, string reasons)
        {
            ABSENCE item = new ABSENCE();
            var f = new F_ABSENCE();
            item = f.GetSingleById(absenceid);
            item.StudentID = studentid;
            item.Date = date;
            item.Reasons = reasons;
            f.Update(item);
            f.Save();

            return Json(new { status = true });
        }
        public JsonResult DeleteAbsence(long absenceid)
        {
            var f = new F_ABSENCE();
            var item = f.GetSingleById(absenceid);
            f.Delete(item);
            f.Save();
            return Json(new { status = true });
        }
        public JsonResult AddAbsence(long studentid, DateTime date, string reasons)
        {
            ABSENCE item = new ABSENCE();
            item.StudentID = studentid;
            item.Date = date;
            item.Reasons = reasons;
            var f = new F_ABSENCE();
            f.Add(item);
            f.Save();
            var res = item.AbsenceID;
            return Json(new { value = res });
        }

        #endregion
    }
}