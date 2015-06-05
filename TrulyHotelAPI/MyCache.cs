using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Caching;
using TrulyHotelAPI.Models;

namespace TrulyHotelAPI
{
    
    public static class MyCache
    {
     private static   List<DestinationInfo> items = null;
        
        public static IEnumerable<DestinationInfo> GetHotelDestinations(string searchterm, int local = 10)
        {

            string la = ConfigurationManager.AppSettings["10"];
            if (System.Web.HttpRuntime.Cache["desti"] == null || items==null)
            {
                using (StreamReader r = new StreamReader(@"D:\destination.json"))
                {   
                    
                    string json = r.ReadToEnd();
                    items = JsonConvert.DeserializeObject<List<DestinationInfo>>(json);
                    System.Web.HttpRuntime.Cache["desti"] = items;

                    System.Web.HttpRuntime.Cache.Insert("desti", items, null,  DateTime.Now.AddMinutes(240), TimeSpan.Zero);
                }
            }
          //  var filterResults = (List<DestinationInfo>)(System.Web.HttpRuntime.Cache["desti"]);
            int maxresults =0;
            int.TryParse(ConfigurationManager.AppSettings["MaxResults"],out maxresults);
            var returnResults = (from fr in items
                                 where (fr.dest.ToLower().Contains(searchterm.ToLower()) || fr.dest.ToLower().StartsWith(searchterm.ToLower()) || fr.dest.ToLower().EndsWith(searchterm.ToLower()) && fr.lo.Equals(la))
                                orderby fr.pr ascending
                                 select fr).Take(maxresults);
            return returnResults;
        }

    }
}