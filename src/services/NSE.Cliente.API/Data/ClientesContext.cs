using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using NSE.Core.Data;

namespace NSE.Cliente.API.Data
{
    public class ClientesContext : DbContext, IUnitOfWork
    {
        public ClientesContext(DbContextOptions options) : base(options)
        {
        }

        public async Task<bool> Commit()
        {
            return await base.SaveChangesAsync() > 0;
        }
    }
}