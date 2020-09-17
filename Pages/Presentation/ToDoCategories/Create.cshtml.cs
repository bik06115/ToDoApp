using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using ToDoApp.Data;
using ToDoApp.Models;

namespace ToDoApp.Pages.Presentation.ToDoCategories
{
    public class CreateModel : PageModel
    {
        private readonly ToDoApp.Data.ToDoAppContext _context;

        public CreateModel(ToDoApp.Data.ToDoAppContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
        ViewData["CatId"] = new SelectList(_context.Category, "Id", "Id");
        ViewData["ToDoId"] = new SelectList(_context.ToDo, "Id", "Id");
            return Page();
        }

        [BindProperty]
        public ToDoCategory ToDoCategory { get; set; }

        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.ToDoCategory.Add(ToDoCategory);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
