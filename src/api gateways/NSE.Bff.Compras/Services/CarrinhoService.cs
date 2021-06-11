using System;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.Extensions.Options;
using NSE.Bff.Compras.Extensions;
using NSE.Bff.Compras.Models;
using NSE.Core.Communication;

namespace NSE.Bff.Compras.Services
{
    public interface ICarrinhoService
    {
        Task<CarrinhoDTO> ObterCarrinho();
        Task<int> ObterQuantidadeCarrinho();
        Task<ResponseResult> AdicionarItemCarrinho(ItemCarrinhoDTO produto);
        Task<ResponseResult> AtualizarItemCarrinho(Guid produtoId, ItemCarrinhoDTO carrinho);
        Task<ResponseResult> RemoverItemCarrinho(Guid produtoId);
    }

    public class CarrinhoService : Service, ICarrinhoService
    {
        private readonly HttpClient _httpClient;

        public CarrinhoService(HttpClient httpClient, IOptions<AppServicesSettings> settings)
        {
            _httpClient = httpClient;
            _httpClient.BaseAddress = new Uri(settings.Value.CarrinhoUrl);
        }

        public Task<CarrinhoDTO> ObterCarrinho()
        {
            throw new NotImplementedException();
        }

        public Task<int> ObterQuantidadeCarrinho()
        {
            throw new NotImplementedException();
        }

        public Task<ResponseResult> AdicionarItemCarrinho(ItemCarrinhoDTO produto)
        {
            throw new NotImplementedException();
        }

        public Task<ResponseResult> AtualizarItemCarrinho(Guid produtoId, ItemCarrinhoDTO carrinho)
        {
            throw new NotImplementedException();
        }

        public Task<ResponseResult> RemoverItemCarrinho(Guid produtoId)
        {
            throw new NotImplementedException();
        }
    }
}