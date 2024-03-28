using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TechLight.DATA.EF.Models;

namespace TechLight.UI.MVC.Controllers
{
    [Authorize(Roles = "Admin")]
    public class TradersController : Controller
    {
        private readonly TechLightContext _context;

        public TradersController(TechLightContext context)
        {
            _context = context;
        }

        // GET: Traders
        public async Task<IActionResult> Index()
        {
              return _context.Traders != null ? 
                          View(await _context.Traders.ToListAsync()) :
                          Problem("Entity set 'TechLightContext.Traders'  is null.");
        }

        // GET: Traders/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Traders == null)
            {
                return NotFound();
            }

            var trader = await _context.Traders
                .FirstOrDefaultAsync(m => m.TraderId == id);
            if (trader == null)
            {
                return NotFound();
            }

            return View(trader);
        }

        // GET: Traders/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Traders/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("TraderId,TraderName,Address,City,State,Zip,Phone")] Trader trader)
        {
            if (ModelState.IsValid)
            {
                _context.Add(trader);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(trader);
        }

        // GET: Traders/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Traders == null)
            {
                return NotFound();
            }

            var trader = await _context.Traders.FindAsync(id);
            if (trader == null)
            {
                return NotFound();
            }
            return View(trader);
        }

        // POST: Traders/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("TraderId,TraderName,Address,City,State,Zip,Phone")] Trader trader)
        {
            if (id != trader.TraderId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(trader);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TraderExists(trader.TraderId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(trader);
        }

        // GET: Traders/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Traders == null)
            {
                return NotFound();
            }

            var trader = await _context.Traders
                .FirstOrDefaultAsync(m => m.TraderId == id);
            if (trader == null)
            {
                return NotFound();
            }

            return View(trader);
        }

        // POST: Traders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Traders == null)
            {
                return Problem("Entity set 'TechLightContext.Traders'  is null.");
            }
            var trader = await _context.Traders.FindAsync(id);
            if (trader != null)
            {
                _context.Traders.Remove(trader);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TraderExists(int id)
        {
          return (_context.Traders?.Any(e => e.TraderId == id)).GetValueOrDefault();
        }
    }
}
