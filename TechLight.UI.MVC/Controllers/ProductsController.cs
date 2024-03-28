﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TechLight.DATA.EF.Models;
using Microsoft.AspNetCore.Authorization;

namespace TechLight.UI.MVC.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ProductsController : Controller
    {
        private readonly TechLightContext _context;

        public ProductsController(TechLightContext context)
        {
            _context = context;
        }

        // GET: Products
        [AllowAnonymous]
        public async Task<IActionResult> Index()
        {
            var techLightContext = _context.Products
                .Include(p => p.Category)
                .Include(p => p.RaidStatus)
                .Include(p => p.Status)
                .Include(p => p.Trader);
            return View(await techLightContext.ToListAsync());
        }

        [AllowAnonymous]
        public async Task<IActionResult> TiledProducts()
        {
            var products = _context.Products
                .Include(p => p.Category)
                .Include(p => p.RaidStatus)
                .Include(p => p.Status)
                .Include(p => p.Trader);
            return View(await products.ToListAsync());
        }

        // GET: Products/Details/5
        [AllowAnonymous]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Category)
                .Include(p => p.RaidStatus)
                .Include(p => p.Status)
                .Include(p => p.Trader)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // GET: Products/Create
        public IActionResult Create()
        {
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryName");
            ViewData["RaidStatusId"] = new SelectList(_context.RaidStatuses, "RaidStatusId", "RaidStatusDesc");
            ViewData["StatusId"] = new SelectList(_context.Statuses, "StatusId", "StatusName");
            ViewData["TraderId"] = new SelectList(_context.Traders, "TraderId", "TraderName");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProductId,ProductName,Price,ProductDesc,UnitsInStock,StatusId,CategoryId,TraderId,RaidStatusId,ProductImage")] Product product)
        {
            if (ModelState.IsValid)
            {
                _context.Add(product);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryName", product.CategoryId);
            ViewData["RaidStatusId"] = new SelectList(_context.RaidStatuses, "RaidStatusId", "RaidStatusDesc", product.RaidStatusId);
            ViewData["StatusId"] = new SelectList(_context.Statuses, "StatusId", "StatusName", product.StatusId);
            ViewData["TraderId"] = new SelectList(_context.Traders, "TraderId", "TraderName", product.TraderId);
            return View(product);
        }

        // GET: Products/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryName", product.CategoryId);
            ViewData["RaidStatusId"] = new SelectList(_context.RaidStatuses, "RaidStatusId", "RaidStatusDesc", product.RaidStatusId);
            ViewData["StatusId"] = new SelectList(_context.Statuses, "StatusId", "StatusName", product.StatusId);
            ViewData["TraderId"] = new SelectList(_context.Traders, "TraderId", "TraderName", product.TraderId);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProductId,ProductName,Price,ProductDesc,UnitsInStock,StatusId,CategoryId,TraderId,RaidStatusId,ProductImage")] Product product)
        {
            if (id != product.ProductId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(product);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.ProductId))
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
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryName", product.CategoryId);
            ViewData["RaidStatusId"] = new SelectList(_context.RaidStatuses, "RaidStatusId", "RaidStatusDesc", product.RaidStatusId);
            ViewData["StatusId"] = new SelectList(_context.Statuses, "StatusId", "StatusName", product.StatusId);
            ViewData["TraderId"] = new SelectList(_context.Traders, "TraderId", "TraderName", product.TraderId);
            return View(product);
        }

        // GET: Products/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Category)
                .Include(p => p.RaidStatus)
                .Include(p => p.Status)
                .Include(p => p.Trader)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Products == null)
            {
                return Problem("Entity set 'TechLightContext.Products'  is null.");
            }
            var product = await _context.Products.FindAsync(id);
            if (product != null)
            {
                _context.Products.Remove(product);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProductExists(int id)
        {
          return (_context.Products?.Any(e => e.ProductId == id)).GetValueOrDefault();
        }
    }
}
