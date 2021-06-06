using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace NSE.WebApp.MVC.Controllers
{
    public class CatalogoController : Controller
    {
        [HttpGet]
        [Route("")]
        [Route("vitrine")]
        public async Task<IActionResult> Index()
        {
            return View();
        }

        [HttpGet]
        [Route("produto-detalhe/{id}")]
        public async Task<IActionResult> ProdutoDetalhe(Guid id)
        {
            return View();
        }
    }
}