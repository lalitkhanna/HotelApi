using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TrulyHotelAPI.Models;

namespace TrulyHotelAPI.Controllers
{
    public class AutoCompleterController : ApiController
    {
        [HttpGet]
        public IEnumerable<DestinationInfo> GetHotelDestinations(string searchterm, int local = 10)
        {
            Dictionary<string, string> lang = new Dictionary<string, string>();
            //Return from cache
            
            return MyCache.GetHotelDestinations(searchterm,local);
        }
        public string ping(string data)
        {
            return data;
        }
    }
}
