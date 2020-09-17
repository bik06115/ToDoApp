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
    public class DeleteModel : PageModel
    {
        private readonly ToDoApp.Data.ToDoAppContext _context;

        public DeleteModel(ToDoApp.Data.ToDoAppContext context)
        {
            _context = context;
        }

        [BindProperty]
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

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            ToDoCategory = await _context.ToDoCategory.FindAsync(id);

            if (ToDoCategory != null)
            {
                _context.ToDoCategory.Remove(ToDoCategory);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
