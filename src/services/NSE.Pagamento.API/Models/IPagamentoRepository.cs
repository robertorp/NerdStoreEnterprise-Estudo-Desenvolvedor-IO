using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using NSE.Core.Data;

namespace NSE.Pagamento.API.Models
{
    public interface IPagamentoRepository : IRepository<Pagamento>
    {
        void AdicionarPagamento(NSE.Pagamento.API.Models.Pagamento pagamento);
        void AdicionarTransacao(Transacao transacao);
        Task<NSE.Pagamento.API.Models.Pagamento> ObterPagamentoPorPedidoId(Guid pedidoId);
        Task<IEnumerable<Transacao>> ObterTransacaoesPorPedidoId(Guid pedidoId);
    }
}