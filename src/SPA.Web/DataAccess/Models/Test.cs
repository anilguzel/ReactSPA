using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace SPA.Web.DataAccess.Models
{
    public class Test
    {
        public int Id { get; set; }
        public string Title { get; set; }
    }

    public class TestMap
    {
        public TestMap(EntityTypeBuilder<Test> testBuilder)
        {
            testBuilder.HasKey(x => x.Id);
            testBuilder.ToTable("test");

            testBuilder.Property(x => x.Id).HasColumnName("id");
            testBuilder.Property(x => x.Title).HasColumnName("title");
        }
    }
}
