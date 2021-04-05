using System.Web.Optimization;

namespace FSDP.UI.MVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.IgnoreList.Clear();

            //bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
            //            "~/Scripts/jquery-{version}.js"));

            //bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
            //            "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            //bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
            //            "~/Scripts/modernizr-*"));

            //bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
            //          "~/Scripts/bootstrap.js",
            //          "~/Scripts/respond.js"));


            #region Style Bundles
            bundles.Add(new StyleBundle("~/Content/css").Include(
                  "~/Content/bootstrap.css",
                  "~/Content/site.css",
                  "~/Content/css/style.default.css",
                  "~/Content/css/custom.css"
                        ));

            bundles.Add(new StyleBundle("~/Content/vendor").Include(
                  "~/Content/vendor/bootstrap/css/bootstrap.min.css",
                  "~/Content/vendor/owl.carousel2/assets/owl.carousel.min.css",
                  "~/Content/vendor/owl.carousel2/assets/owl.theme.default.min.css"
                ));

            bundles.Add(new StyleBundle("~/Content/img").Include(
                  "~/Content/img/favicon.png"));

            #endregion

            #region Script Bundles

            bundles.Add(new ScriptBundle("~/Content/vendor").Include(
                 "~/Content/vendor/jquery/jquery.min.js",
                "~/Content/vendor/bootstrap/js/bootstrap.bundle.min.js",
                "~/Content/vendor/owl.carousel2/owl.carousel.min.js",
                "~/Content/vendor/jquery-circle-progress/circle-progress.min.js",
                "~/Content/vendor/smooth-scroll/smooth-scroll.min.js",
                "~/Content/vendor/jquery.countdown/jquery.countdown.js"
                ));
           bundles.Add(new ScriptBundle("~/Content/js").Include(
                  "~/Content/js/front.js"));

            #endregion


        }
    }
}
