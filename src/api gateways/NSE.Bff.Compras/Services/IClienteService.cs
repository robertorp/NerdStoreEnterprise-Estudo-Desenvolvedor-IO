using System.Threading.Tasks;
using NSE.Bff.Compras.Models;

namespace NSE.Bff.Compras.Services
{
    public interface IClienteService
    {
        Task<EnderecoDTO> ObterEndereco();
    }
}