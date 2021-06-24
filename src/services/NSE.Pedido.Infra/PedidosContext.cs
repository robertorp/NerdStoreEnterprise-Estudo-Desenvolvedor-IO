using Microsoft.EntityFrameworkCore;

namespace NSE.Pedido.Infra
{
    public class PedidosContext : DbContext
    {
        public PedidosContext(DbContextOptions options) : base(options)
        {
        }
    }
}