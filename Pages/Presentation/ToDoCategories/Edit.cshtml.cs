using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ToDoApp.Data;
using ToDoApp.Models;

namespace ToDoApp.Pages.Presentation.ToDoCategories
{
    public class EditModel : PageModel
    {
        private readonly ToDoApp.Data.ToDoAppContext _context;

        public EditModel(ToDoApp.Data.ToDoAppContext context)
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
           ViewData["CatId"] = new SelectList(_context.Category, "Id", "Id");
           ViewData["ToDoId"] = new SelectList(_context.ToDo, "Id", "Id");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(ToDoCategory).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ToDoCategoryExists(ToDoCategory.ToDoCatId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool ToDoCategoryExists(int id)
        {
            return _context.ToDoCategory.Any(e => e.ToDoCatId == id);
        }
    }
}
