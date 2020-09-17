using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using ToDoApp.Models;

namespace ToDoApp.Data
{
    public class ToDoAppContext : DbContext
    {
        public ToDoAppContext (DbContextOptions<ToDoAppContext> options)
            : base(options)
        {
        }

        public DbSet<ToDoApp.Models.User> User { get; set; }

        public DbSet<ToDoApp.Models.ToDo> ToDo { get; set; }

        public DbSet<ToDoApp.Models.Comment> Comment { get; set; }

        public DbSet<ToDoApp.Models.Category> Category { get; set; }

        public DbSet<ToDoApp.Models.ToDoCategory> ToDoCategory { get; set; }
    }
}
