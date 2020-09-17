using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ToDoApp.Data;
using ToDoApp.Models;

namespace ToDoApp.Pages.Presentation.Comments
{
    public class IndexModel : PageModel
    {
        private readonly ToDoApp.Data.ToDoAppContext _context;

        public IndexModel(ToDoApp.Data.ToDoAppContext context)
        {
            _context = context;
        }

        public IList<Comment> Comment { get;set; }

        public async Task OnGetAsync()
        {
            Comment = await _context.Comment
                .Include(c => c.ToDO).ToListAsync();
        }
    }
}
