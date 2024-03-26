using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TechLight.DATA.EF.Models;

namespace TechLight.UI.MVC.Controllers
{
    public class ProductOrdersController : Controller
    {
        private readonly TechLightContext _context;

        public ProductOrdersController(TechLightContext context)
        {
            _context = context;
        }

        // GET: ProductOrders
        public async Task<IActionResult> Index()
        {
            var techLightContext = _context.ProductOrders.Include(p => p.Order).Include(p => p.Product);
            return View(await techLightContext.ToListAsync());
        }

        // GET: ProductOrders/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.ProductOrders == null)
            {
                return NotFound();
            }

            var productOrder = await _context.ProductOrders
                .Include(p => p.Order)
                .Include(p => p.Product)
                .FirstOrDefaultAsync(m => m.ProductOrderId == id);
            if (productOrder == null)
            {
                return NotFound();
            }

            return View(productOrder);
        }

        // GET: ProductOrders/Create
        public IActionResult Create()
        {
            ViewData["OrderId"] = new SelectList(_context.Orders, "OrderId", "CustomerId");
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "ProductName");
            return View();
        }

        // POST: ProductOrders/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProductOrderId,OrderId,ProductId,Quantity,Price")] ProductOrder productOrder)
        {
            if (ModelState.IsValid)
            {
                _context.Add(productOrder);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["OrderId"] = new SelectList(_context.Orders, "OrderId", "CustomerId", productOrder.OrderId);
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "ProductName", productOrder.ProductId);
            return View(productOrder);
        }

        // GET: ProductOrders/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.ProductOrders == null)
            {
                return NotFound();
            }

            var productOrder = await _context.ProductOrders.FindAsync(id);
            if (productOrder == null)
            {
                return NotFound();
            }
            ViewData["OrderId"] = new SelectList(_context.Orders, "OrderId", "CustomerId", productOrder.OrderId);
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "ProductName", productOrder.ProductId);
            return View(productOrder);
        }

        // POST: ProductOrders/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProductOrderId,OrderId,ProductId,Quantity,Price")] ProductOrder productOrder)
        {
            if (id != productOrder.ProductOrderId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(productOrder);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductOrderExists(productOrder.ProductOrderId))
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
            ViewData["OrderId"] = new SelectList(_context.Orders, "OrderId", "CustomerId", productOrder.OrderId);
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "ProductName", productOrder.ProductId);
            return View(productOrder);
        }

        // GET: ProductOrders/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.ProductOrders == null)
            {
                return NotFound();
            }

            var productOrder = await _context.ProductOrders
                .Include(p => p.Order)
                .Include(p => p.Product)
                .FirstOrDefaultAsync(m => m.ProductOrderId == id);
            if (productOrder == null)
            {
                return NotFound();
            }

            return View(productOrder);
        }

        // POST: ProductOrders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.ProductOrders == null)
            {
                return Problem("Entity set 'TechLightContext.ProductOrders'  is null.");
            }
            var productOrder = await _context.ProductOrders.FindAsync(id);
            if (productOrder != null)
            {
                _context.ProductOrders.Remove(productOrder);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProductOrderExists(int id)
        {
          return (_context.ProductOrders?.Any(e => e.ProductOrderId == id)).GetValueOrDefault();
        }
    }
}
