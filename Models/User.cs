using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ToDoApp.Models
{
    public class User
    {
        [Key] // this is Key annotation used to set PK
        public int Id { get; set; } // this is a primary key 
        public string Name { get; set; } // property stores name of user
        public string Email { get; set; } // property store email of user
        // List of Todos and comment
        public IList<ToDo> Todos { get; set; }
     
        public User()
        {
            // Instantianting List of Todo and comment and initialize
            Todos = new List<ToDo>();
         
        }

    }
}
