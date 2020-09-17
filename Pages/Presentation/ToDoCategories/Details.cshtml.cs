using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ToDoApp.Data;
using ToDoApp.Models;

namespace ToDoApp.Pages.Presentation.ToDoCategories
{
    public class DetailsModel : PageModel
    {
        private readonly ToDoApp.Data.ToDoAppContext _context;

        public DetailsModel(ToDoApp.Data.ToDoAppContext context)
        {
            _context = context;
        }

        public ToDoCategory ToDoCategory { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            ToDoCategory = await _context.ToDoCategory
                .Include(t => t.Category)
                .Include(t => t.ToDo).FirstOrDefaultAsync(m => m.ToDoCatId == id);

            if (ToDoCategory == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
