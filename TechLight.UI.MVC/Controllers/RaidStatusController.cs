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
    public class RaidStatusController : Controller
    {
        private readonly TechLightContext _context;

        public RaidStatusController(TechLightContext context)
        {
            _context = context;
        }

        // GET: RaidStatus
        public async Task<IActionResult> Index()
        {
              return _context.RaidStatuses != null ? 
                          View(await _context.RaidStatuses.ToListAsync()) :
                          Problem("Entity set 'TechLightContext.RaidStatuses'  is null.");
        }

        // GET: RaidStatus/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.RaidStatuses == null)
            {
                return NotFound();
            }

            var raidStatus = await _context.RaidStatuses
                .FirstOrDefaultAsync(m => m.RaidStatusId == id);
            if (raidStatus == null)
            {
                return NotFound();
            }

            return View(raidStatus);
        }

        // GET: RaidStatus/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: RaidStatus/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("RaidStatusId,RaidStatusDesc")] RaidStatus raidStatus)
        {
            if (ModelState.IsValid)
            {
                _context.Add(raidStatus);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(raidStatus);
        }

        // GET: RaidStatus/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.RaidStatuses == null)
            {
                return NotFound();
            }

            var raidStatus = await _context.RaidStatuses.FindAsync(id);
            if (raidStatus == null)
            {
                return NotFound();
            }
            return View(raidStatus);
        }

        // POST: RaidStatus/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("RaidStatusId,RaidStatusDesc")] RaidStatus raidStatus)
        {
            if (id != raidStatus.RaidStatusId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(raidStatus);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!RaidStatusExists(raidStatus.RaidStatusId))
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
            return View(raidStatus);
        }

        // GET: RaidStatus/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.RaidStatuses == null)
            {
                return NotFound();
            }

            var raidStatus = await _context.RaidStatuses
                .FirstOrDefaultAsync(m => m.RaidStatusId == id);
            if (raidStatus == null)
            {
                return NotFound();
            }

            return View(raidStatus);
        }

        // POST: RaidStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.RaidStatuses == null)
            {
                return Problem("Entity set 'TechLightContext.RaidStatuses'  is null.");
            }
            var raidStatus = await _context.RaidStatuses.FindAsync(id);
            if (raidStatus != null)
            {
                _context.RaidStatuses.Remove(raidStatus);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool RaidStatusExists(int id)
        {
          return (_context.RaidStatuses?.Any(e => e.RaidStatusId == id)).GetValueOrDefault();
        }
    }
}
