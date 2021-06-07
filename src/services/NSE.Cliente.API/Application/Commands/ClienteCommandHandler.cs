using System.Threading;
using System.Threading.Tasks;
using FluentValidation.Results;
using MediatR;

namespace NSE.Cliente.API.Application.Commands
{
    public class ClienteCommandHandler : IRequestHandler<RegistrarClienteCommand, ValidationResult>
    {
        public async Task<ValidationResult> Handle(RegistrarClienteCommand message, CancellationToken cancellationToken)
        {
            if (!message.EhValido()) return message.ValidationResult;

            var cliente = new Models.Cliente(message.Id, message.Nome, message.Email, message.Cpf);



            return message.ValidationResult;
        }
    }
}