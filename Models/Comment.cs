using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ToDoApp.Models
{
    public class Comment
    {
        [Key]
        public int Id { get; set; } // thjs is Primary Key 
        public string Body { get; set; } // Body of comment
        
        // foreign key property  for Todo
        [ForeignKey("ToDo")]
        public int TodoId { get; set; }
        public ToDo ToDO { get; set; }

    }
}
