using Microsoft.AspNetCore.Mvc;
using NSE.Pedidos.API.Application.DTO;
using NSE.WebAPI.Core.Controller;

namespace NSE.Pedidos.API.Controllers
{
    [Route("/vouchers")]
    public class VoucherController : MainController
    {
        [HttpGet]
        public IActionResult ObterVaucher()
        {
            return CustomResponse(new VoucherDTO());
        }
    }
}