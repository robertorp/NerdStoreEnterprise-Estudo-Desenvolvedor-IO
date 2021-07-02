using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using NSE.Pedidos.API.Application.DTO;
using NSE.Pedidos.Domain.Pedidos;

namespace NSE.Pedidos.API.Application.Queries
{
    public interface IPedidoQueries
    {
        Task<PedidoDTO> ObterUltimoPedido(Guid clienteId);

        Task<IEnumerable<PedidoDTO>> ObterListaPorClienteId(Guid clienteId);
    }

    public class PedidoQueries : IPedidoQueries
    {
        private readonly IPedidoRepository _pedidoRepository;

        public PedidoQueries(IPedidoRepository pedidoRepository)
        {
            _pedidoRepository = pedidoRepository;
        }

        public async Task<PedidoDTO> ObterUltimoPedido(Guid clienteId)
        {
            const string sql = @"SELECT
                                P.ID AS 'ProdutoId', P.CODIGO, P.VOUCHERUTILIZADO, P.DESCONTO, P.VALORTOTAL,P.PEDIDOSTATUS,
                                P.LOGRADOURO,P.NUMERO, P.BAIRRO, P.CEP, P.COMPLEMENTO, P.CIDADE, P.ESTADO,
                                PIT.ID AS 'ProdutoItemId',PIT.PRODUTONOME, PIT.QUANTIDADE, PIT.PRODUTOIMAGEM, PIT.VALORUNITARIO 
                                FROM PEDIDOS P 
                                INNER JOIN PEDIDOITEMS PIT ON P.ID = PIT.PEDIDOID 
                                WHERE P.CLIENTEID = @clienteId 
                                AND P.DATACADASTRO between DATEADD(minute, -3,  GETDATE()) and DATEADD(minute, 0,  GETDATE())
                                AND P.PEDIDOSTATUS = 1 
                                ORDER BY P.DATACADASTRO DESC";

            const string sqlPgSql = "SELECT P.\"Id\" AS \"ProdutoId\", P.\"Codigo\" , P.\"VoucherUtilizado\" , P.\"Desconto\" , P.\"ValorTotal\" " +
                                    ",P.\"PedidoStatus\" ,P.\"Logradouro\" ,P.\"Numero\" , P.\"Bairro\" , P.\"Cep\" , P.\"Complemento\" " +
                                    ", P.\"Cidade\" , P.\"Estado\" ,PIT.\"Id\" AS \"ProdutoItemId\",PIT.\"ProdutoNome\" , PIT.\"Quantidade\" " +
                                    ", PIT.\"ProdutoImagem\" , PIT.\"ValorUnitario\" FROM \"Pedidos\" as P INNER JOIN \"PedidoItems\" PIT ON " +
                                    "P.\"Id\" = PIT.\"PedidoId\" WHERE P.\"ClienteId\" = @clienteId " +
                                    "AND P.\"PedidoStatus\" = 1 ORDER BY P.\"DataCadastro\" desc limit 1";

            var pedido = await _pedidoRepository.ObterConexao()
                .QueryAsync<dynamic>(sqlPgSql, new { clienteId });

            return MapearPedido(pedido);
        }

        public async Task<IEnumerable<PedidoDTO>> ObterListaPorClienteId(Guid clienteId)
        {
            var pedidos = await _pedidoRepository.ObterListaPorClienteId(clienteId);

            return pedidos.Select(PedidoDTO.ParaPedidoDTO);
        }

        private PedidoDTO MapearPedido(dynamic result)
        {
            var pedido = new PedidoDTO
            {
                Codigo = result[0].Codigo,
                Status = result[0].PedidoStatus,
                ValorTotal = result[0].ValorTotal,
                Desconto = result[0].Desconto,
                VoucherUtilizado = result[0].VoucherUtilizado,

                PedidoItems = new List<PedidoItemDTO>(),
                Endereco = new EnderecoDTO
                {
                    Logradouro = result[0].Logradouro,
                    Bairro = result[0].Bairro,
                    Cep = result[0].Cep,
                    Cidade = result[0].Cidade,
                    Complemento = result[0].Complemento,
                    Estado = result[0].Estado,
                    Numero = result[0].Numero
                }
            };

            foreach (var item in result)
            {
                var pedidoItem = new PedidoItemDTO
                {
                    Nome = item.ProdutoNome,
                    Valor = item.ValorUnitario,
                    Quantidade = item.Quantidade,
                    Imagem = item.ProdutoImagem
                };

                pedido.PedidoItems.Add(pedidoItem);
            }

            return pedido;
        }
    }

}