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
    public class IndexModel : PageModel
    {
        private readonly ToDoApp.Data.ToDoAppContext _context;

        public IndexModel(ToDoApp.Data.ToDoAppContext context)
        {
            _context = context;
        }

        public IList<ToDoCategory> ToDoCategory { get;set; }

        public async Task OnGetAsync()
        {
            ToDoCategory = await _context.ToDoCategory
                .Include(t => t.Category)
                .Include(t => t.ToDo).ToListAsync();
        }
    }
}
