using System.Threading;
using System.Threading.Tasks;
using MediatR;
using NSE.Core.Messages.Integration;
using NSE.MessageBus;

namespace NSE.Pedidos.API.Application.Events
{
    public class PedidoEventHandler : INotificationHandler<PedidoRealizadoEvent>
    {
        private readonly IMessageBus _messageBus;

        public PedidoEventHandler(IMessageBus messageBus)
        {
            _messageBus = messageBus;
        }

        public async Task Handle(PedidoRealizadoEvent menssage, CancellationToken cancellationToken)
        {
            await _messageBus.PublishAsync(new PedidoRealizadoIntegrationEvent(menssage.ClienteId));
        }
    }
}