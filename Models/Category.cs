using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace ToDoApp.Models
{
    public class Category
    {
        [Key]
        public int Id { get; set; } // Primary Key Set
        public string Name { get; set; } // Name of Category
        public IList<ToDoCategory> ToDoCategory { get; set; } // Todo Category List (Many TodoCategories)
        public Category()
        {
            ToDoCategory = new List<ToDoCategory>(); // Initializing List of ToDoCategory
        }

    }
}
