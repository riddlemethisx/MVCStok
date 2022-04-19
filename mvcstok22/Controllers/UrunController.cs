using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvcstok22.Models.Entity;





//BU CONTROLLERDA ÜRÜN EKLEME-SİLME-GÜNCELLEME İŞLEMLERİNİ YAPARIZ



namespace mvcstok22.Controllers
{
    public class UrunController : Controller
    {

        mvcstokEntities db = new mvcstokEntities();   //database
        



        public ActionResult Index()
        {
            var degerler = db.urunler.ToList();     
            return View(degerler);
        }



        [HttpGet]       //UrunEkle sayfası çağırılırsa
        public ActionResult UrunEkle()
        {
            return View();
        }



        [HttpPost]      //UrunEkle'ye veri gönderilirse

        public ActionResult UrunEkle(urunler s1)
        {
            db.urunler.Add(s1);
            db.SaveChanges();
            return View();
        }


        public ActionResult SIL(int id)
        {
            var urun = db.urunler.Find(id);     //id'e sahip ürünü bul
            db.urunler.Remove(urun);
            db.SaveChanges();

            return RedirectToAction("Index");       //index sayfasına geri dön
        }




        public ActionResult UrunGetir(int id)       //güncelleme işlemi sırasında ürün bilgilerini geitrmek için kullanılır
        {
            var urun = db.urunler.Find(id);
            return View("UrunGetir", urun);     //UrunGetir sayfasına dön. urun adlı objeyi ilet
        }

        public ActionResult GUNCELLE(urunler p)
        {
            //URUNID'e sahip ürünü bul. //ve bulunan ürünü textboxlardaki değerler ile değiştir
            var urun = db.urunler.Find(p.URUNID);

            urun.URUNID = p.URUNID;
            urun.URUNAD = p.URUNAD;
            urun.URUNKATEGORI = p.URUNKATEGORI;
            urun.FIYAT = p.FIYAT;
            urun.MARKA = p.MARKA;
            urun.STOK =  p.STOK;

            db.SaveChanges();
            return RedirectToAction("Index");

        }


    }
}