// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using NSE.Pedidos.Infra.Data;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

namespace NSE.Pedidos.Infra.Migrations
{
    [DbContext(typeof(PedidosContext))]
    [Migration("20210625000629_Vourcher")]
    partial class Vourcher
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 63)
                .HasAnnotation("ProductVersion", "5.0.6")
                .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

            modelBuilder.Entity("NSE.Pedidos.Domain.Vouchers.Voucher", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<bool>("Ativo")
                        .HasColumnType("boolean");

                    b.Property<string>("Codigo")
                        .IsRequired()
                        .HasColumnType("varchar(100)");

                    b.Property<DateTime>("DataCriacao")
                        .HasColumnType("timestamp without time zone");

                    b.Property<DateTime?>("DataUtilizacao")
                        .HasColumnType("timestamp without time zone");

                    b.Property<DateTime>("DataValidade")
                        .HasColumnType("timestamp without time zone");

                    b.Property<decimal?>("Percentual")
                        .HasColumnType("numeric");

                    b.Property<int>("Quantidade")
                        .HasColumnType("integer");

                    b.Property<int>("TipoDesconto")
                        .HasColumnType("integer");

                    b.Property<bool>("Utilizado")
                        .HasColumnType("boolean");

                    b.Property<decimal?>("ValorDesconto")
                        .HasColumnType("numeric");

                    b.HasKey("Id");

                    b.ToTable("Vouchers");
                });
#pragma warning restore 612, 618
        }
    }
}
