using System.Threading.Tasks;
using NSE.Core.Messages.Integration;

namespace NSE.Pagamento.API.Services
{
    public class PagamentoService : IPagamentoService
    {
        public Task<ResponseMessage> AutorizarPagamento(Models.Pagamento pagamento)
        {
            throw new System.NotImplementedException();
        }
    }
}