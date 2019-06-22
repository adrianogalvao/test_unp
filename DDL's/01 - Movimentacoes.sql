use TestUnP
go

if not exists(select 1 from sys.tables where name = 'Movimentacao')
begin
	create table Movimentacao(
		IdMovimentacao Int identity (1,1) primary key,
		TipoMovimentacao char(1) not null constraint CK_TIPO check(TipoMovimentacao = 'D' or TipoMovimentacao = 'C'),
		Valor decimal(15,2),
		DataCriacao datetime default getdate()
	)
end
go