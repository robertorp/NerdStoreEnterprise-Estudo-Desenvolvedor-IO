using System.Threading.Tasks;
using Microsoft.Extensions.Options;
using NSE.Pagamento.API.Models;

namespace NSE.Pagamento.API.Facade
{
    public class PagamentoCartaoCreditoFacade : IPagamentoFacade
    {
        private readonly PagamentoConfig _pagamentoConfig;

        public PagamentoCartaoCreditoFacade(IOptions<PagamentoConfig> pagamentoConfig)
        {
            _pagamentoConfig = pagamentoConfig.Value;
        }

        public async Task<Transacao> AutorizarPagamento(Models.Pagamento pagamento)
        {
            throw new System.NotImplementedException();
        }
    }
}