using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SPA.Web.DataAccess;
using SPA.Web.DataAccess.Models;

namespace SPA.Web.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class TestController : ControllerBase
    {
        private readonly ApiDbContext _apiDbContext;

        public TestController(ApiDbContext apiDbContext)
        {
            _apiDbContext = apiDbContext;
        }

        [HttpGet("title")]
        public IActionResult Title()
        {
            var test = _apiDbContext.Tests.FirstOrDefault();
            return Ok(test?.Title);
        }

        [HttpGet]
        public IEnumerable<Test> Get()
        {
            return _apiDbContext.Tests.ToList();
        }
    }
}