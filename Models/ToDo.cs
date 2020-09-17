using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ToDoApp.Models
{
    public class ToDo
    {
        [Key] // PK
        public int Id { get; set; } // Primary Key Field Todo
        public string Title { get; set; } // Title of ToDo
        public string Description { get; set; } // Some description about todo
        [DataType(DataType.Date)]
        public DateTime DeadLine { get; set; } // deadline

        // foregin Key Field
        [ForeignKey("User")]
        public int UserId { get; set; }
        public User User { get; set; }
        // Todo Priority
        public bool HighPriority { get; set; }
        // ToDoCategory and Comment Lists
        public IList<ToDoCategory> ToDoCategory { get; set; }
        public IList<Comment> Comment { get; set; }
        public ToDo()
        {
            // Instantiating List of above objects
            ToDoCategory = new List<ToDoCategory>();
            Comment = new List<Comment>();
        }
    }
}
