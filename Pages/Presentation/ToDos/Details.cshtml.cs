using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ToDoApp.Data;
using ToDoApp.Models;

namespace ToDoApp.Pages.Presentation.ToDos
{
    public class DetailsModel : PageModel
    {
        private readonly ToDoApp.Data.ToDoAppContext _context;

        public DetailsModel(ToDoApp.Data.ToDoAppContext context)
        {
            _context = context;
        }

        public ToDo ToDo { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            ToDo = await _context.ToDo
                .Include(t => t.User).FirstOrDefaultAsync(m => m.Id == id);

            if (ToDo == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
