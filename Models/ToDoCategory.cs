using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ToDoApp.Models
{
    public class ToDoCategory
    {
        [Key]// Used for PK
        public int ToDoCatId { get; set; } // Primary Key for ToDoCategory
        [ForeignKey("ToDo")]
        public int ToDoId { get; set; } // Foreign Key One-ToMany relationship
        public ToDo ToDo { get; set; }
        [ForeignKey("Category")]
        public int CatId { get; set; } // Foregin key 1-to-M
        public Category Category { get; set; }
    }
}
